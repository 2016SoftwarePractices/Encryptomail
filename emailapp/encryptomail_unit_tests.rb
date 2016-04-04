require 'rubygems'
require 'gpgme'
load 'encryptomail.rb'

module EmailApp

	class EncryptomailUnitTests


          #test PGP keypair generation
    		def self.testGPGmekeygen(name, email, passphrase)
      		puts "TEST: Attempting to test the creation of a key using GPGme"
      		puts "(GPGme) Trying to generate PGP key - this may take a while: "
      		key_string = EmailApp::Encryptomail.generatePGPkeyGPGme(name, email, passphrase)
      		puts key_string
      		puts "GPGme has successfully created a new keypair for #{email}"
    		end
    		
    		
    		  #test public key export
    		def self.testGPGmeexportpublickey(email)
    		  puts "TEST: Attempting to export public key for #{email}"
     			EmailApp::Encryptomail.exportpublickeyGPGme(email)
    		end
    		
    		
            #test private key export
    		def self.testprivatekeyexport(email)
    		    puts "TEST: Attempting to export private key for gpgmetestuser@test.com"
    		    EmailApp::Encryptomail.exportprivatekey(email)
    		end
    		
    		
    		#test key listing
    		def self.testGPGmelistkeys()
    			EmailApp::Encryptomail.listallpublickeys()
    			EmailApp::Encryptomail.listallprivatekeys()
    		end
    		
    		
    		def self.testkeydeletion(email)
    		  EmailApp::Encryptomail.deleteuserkeys(email)
    		end
    		
    		
    		#test encrypting simple message
    		def self.testEncryptMailString(message, email)
      		puts "TEST: Attempting to test encrypting a message using GPGme"
      		encrypted = EmailApp::Encryptomail.encryptMailString(message, email)
      		puts "GPGme has successfully encrypted a message for #{email}"
      		return encrypted
    		end
    		
    		
    		#test decrypting simple message
    		def self.testDecryptMailString(messageToDecrypt, passphrase)
      		puts "TEST: Attempting to test decrypting a message using GPGme"
      		decrypted = EmailApp::Encryptomail.decryptMailString(messageToDecrypt, passphrase)
      		puts "GPGme has successfully decrypted the message"
      		return decrypted
    		end

	end

#******* Main() ********
# TEST SET 1
#PARAMS
name = "gpgmetestuser"
email = "gpgmetestuser@encryptomail.xyz"
passphrase = "hry785jB"
#TEST SET 1 
#puts EmailApp::EncryptomailUnitTests.testGPGmekeygen(name, email, passphrase)
puts EmailApp::EncryptomailUnitTests.testGPGmeexportpublickey(email)
puts EmailApp::EncryptomailUnitTests.testprivatekeyexport(email)
puts EmailApp::EncryptomailUnitTests.testGPGmelistkeys()


# TEST SET 2
#PARAMS

message = "Ned: Are you now or have you ever been a Norse God,\n
Vampire, or Time Traveling Cyborg?\n
Mike O' Donnell: I've known you since what, first grade?\n
I think that maybe I would have told you!\n
Ned Freedman: Vampire wouldn't tell, Cyborg wouldn't know."

#TESTS
encryptedMessage = EmailApp::EncryptomailUnitTests.testEncryptMailString(message, email)
puts encryptedMessage
decryptedMessage = EmailApp::EncryptomailUnitTests.testDecryptMailString(encryptedMessage, passphrase)
puts decryptedMessage
#puts EmailApp::EncryptomailUnitTests.testkeydeletion(email)

end #END OF THE MODULE