require 'keygenerator'

class GroupsController < EndUserBaseController
	before_action :set_group, only: [:show, :edit, :update, :destroy]

	# GET /groups
	# GET /groups.json
	def index
		@groups = current_user.groups
	end
	
	# GET /groups/1
	# GET /groups/1.json
	def show
		if !@group.users.include? current_user
			redirect_to "/users/"+current_user.id, alert: "You are not allowed to view that page."
		end
	end

	# GET /groups/new
	def new
		@group = Group.new
	end

	# GET /groups/1/edit
	def edit
		@user = User.all
	end

	# POST /groups
	# POST /groups.json
	def create
		
		@group = Group.new(group_params)
		
		@group.users << current_user
		@group.leaders = [current_user.id.to_s]
		@group.email = @group.group_name + $Domain
		
		#commented out Key generation until it works purrrrrrrfectly
		#not sure why i went all 'cat' there
		puts "=============before key generator call====================="
		KeyGenerator::generatePGPkeyGPGme(@group.group_name, @group.email, "asldkfjlksdjf")
		puts "=============after key generator call======================"
		
		current_user.save	
		
		respond_to do |format|
			if @group.save
				format.html { redirect_to @group, notice: 'Group was successfully created.' }
				format.json { render :show, status: :created, location: @group }
			else
				format.html { render :new }
				format.json { render json: @group.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /groups/1
	# PATCH/PUT /groups/1.json
	def update
		respond_to do |format|
			if @group.update(group_params)
				@group.addUser(params[:group_add_user])
				format.html { redirect_to @group, notice: 'Group was successfully updated.' }
				format.json { render :show, status: :ok, location: @group }
			else
				format.html { render :edit }
				format.json { render json: @group.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /groups/1
	# DELETE /groups/1.json
	def destroy
		@group.destroy
		respond_to do |format|
			format.html { redirect_to root_url, notice: 'Group was successfully destroyed.' }
			format.json { head :no_content }
		end
	end
	

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_group
			@group = Group.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def group_params
			params.require(:group).permit(:group_name, :email, :pub_key, :description)
		end
	def group_edit_params
			params.require(:group).permit(:group_name, :email, :pub_key, :description)
			params.permit(:group_add_user)
		end
end
