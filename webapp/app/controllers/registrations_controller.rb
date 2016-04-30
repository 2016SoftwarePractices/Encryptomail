require 'keygenerator'

class RegistrationsController < Devise::RegistrationsController
	prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.

	def check_captcha
		if verify_recaptcha
			true
		else
			self.resource = resource_class.new sign_up_params
			redirect_to new_user_registration_path, alert: "You didn't pass the captcha"
			#respond_with_navigational(resource) { render :new }
		end 
	end

	def new
		super
	end

	def create
        KeyGenerator::importkey(params[:pub_key])
		if KeyGenerator::keyFinder(params[:user][:email]) != nil
			super
			resource.pub_key = params[:pub_key]
			resource.save
		else
			respond_to do |format|
				format.html { redirect_to root_url, notice: 'Account was NOT created. Email and PGP key did NOT match.'}
			end
		end
	end
  
    def destroy
		KeyGenerator::deletekey(@user.email)
		super
	end
	
	def update
		super
	end

end 
