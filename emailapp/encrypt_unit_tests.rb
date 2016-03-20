require 'rubygems'
require 'gpgme'
load 'encrypt.rb'

module EmailApp

	class EncryptUnitTests


          #test encrypting simple message
    		def self.testEncryptMailString(message, email)
      		puts "TEST: Attempting to test encrypting a message using GPGme"
      		encrypted = EmailApp::Encrypt.encryptMailString(message, email)
      		puts encrypted
      		puts "GPGme has successfully a message for #{email}"
    		end
	end

#******* Main() ********

#PARAMS
message = "Ned: Are you now or have you ever been a Norse God,\n
Vampire, or Time Traveling Cyborg?\n
Mike O' Donnell: I've known you since what, first grade?\n
I think that maybe I would have told you!\n
Ned Freedman: Vampire wouldn't tell, Cyborg wouldn't know."
email = "gpgmetestuser@encryptomail.xyz"
#TESTS
puts EmailApp::EncryptUnitTests.testEncryptMailString(message, email)

end
