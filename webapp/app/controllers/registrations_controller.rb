class RegistrationsController < Devise::RegistrationsController
	def new
		super
	end

	def create
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