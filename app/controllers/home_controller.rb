class HomeController < ApplicationController
	def index
	  	if current_user
			redirect_to "/users/"+current_user.id
		end
		
	end

	def login
	end

	def register
		@user = User.new
		
	end

	def registerpost



	end

	def registration_params 
		params.require(:user).permit(:email, :pub_key, :password1, :password2)
	end

  
end
