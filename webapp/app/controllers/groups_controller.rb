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
		@user = current_user
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
		#The created group email should be "group-name + group-id", this will prevent people making groups of the same name
		# with matching emails. Also this makes it so we don't have to return a "this group already exists" error, which would
		# allow people to infer the name of groups on the system
		#We must save first to get an id generated however
		puts "DEBUG==============="
		gname = @group.group_name.gsub(/\s/, "")
		puts gname
		puts "===================="
		if gname =~ /^[a-zA-Z0-9]+$/
			@group.save
			
			@group.email = gname + "+" + @group.id + $Domain
			puts "DEBUG======2========"
			puts @group.email
			puts "===================="
			# Passphrase for pgp keys is bull-s*** right now, may change later
			KeyGenerator::generatePGPkeyGPGme(@group.group_name, @group.email, "asldkfjlksdjf")

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
		else
			respond_to do |format|
				format.html { redirect_to root_url, notice: 'Group was NOT created. Group name must be alpha-numeric characters.'}
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
		KeyGenerator::deletekey(@group.email)
		
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
			params.require(:group).permit(:group_name, :pub_key, :description)
			
			#gr_name = params.require(:group).group_name
			
		end
	def group_edit_params
			params.require(:group).permit(:group_name, :pub_key, :description)
			params.permit(:group_add_user)
		end
end
