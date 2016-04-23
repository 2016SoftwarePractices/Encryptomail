class EmailMailer < ApplicationMailer
	default from: 'info@encryptomail.xyz'
	
	def mass_emailer(groupEmail, user, content)
	    @from = groupEmail
		@user = user
		@url = 'http://encryptomail.xyz'
		mail(to: @user.email, subject: "Encrypted message from #{@from}")
		
	end
	
end