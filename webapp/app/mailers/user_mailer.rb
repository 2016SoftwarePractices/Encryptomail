class UserMailer < ApplicationMailer
	default from: 'info@encryptomail.xyz'
	
	def welcome_email(user) 
		@user = user
		@url = 'http://encryptomail.xyz'
		mail(to: @user.email, subject: 'Welcome to Encryptomail')
		
	end
	
end
