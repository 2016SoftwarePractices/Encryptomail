# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
	:address              => 'localhost',
	:domain               => 'encryptomail.xyz',
	:port                 => 587,
	:enable_starttls_auto => true
}