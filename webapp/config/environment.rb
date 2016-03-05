# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!


#config.action_mailer.
ActionMailer::Base.smtp_settings = {
	:address              => "smtp.gmail.com",
	:domain               => "mail.gmail.com",
	:port                 => 587,
	:user_name            => 'encryptomail@gmail.com',
	:password             => 'WALMARTskypeROPELAPTOPlaptophuluTOKYO',
	:authentication       => :login,
	:enable_starttls_auto => true
}