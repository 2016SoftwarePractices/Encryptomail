# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!


passwordFile = File.new("password.txt")
pword = passwordFile.gets
passwordFile.close

ActionMailer::Base.smtp_settings = {
	:address              => 'smtp.gmail.com',
	:domain               => 'mail.gmail.com',
	:port                 => 587,
	:user_name            => 'encryptomail@gmail.com',
	:password             => pword,
	:authentication       => :login,
	:enable_starttls_auto => true
}