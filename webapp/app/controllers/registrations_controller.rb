class RegistrationsController < Devise::RegistrationsController
	def new
		super
	end

	def create
		if verify_recaptcha(model: @user)
			puts "nice"
		else
			puts "You messed up"
			redirect_to new_user_registration_path, alert: "You failed the captcha"
			return
		end
		super

		UserMailer.welcome_email(resource).deliver_now
		
		#insert pubkey into user
		resource.pub_key = params[:pub_key]
		resource.save
	end
	
	def update
		super
	end
end 
