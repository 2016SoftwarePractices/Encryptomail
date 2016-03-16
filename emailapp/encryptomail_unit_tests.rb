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
    		  # functions = Encryptomail.new
    		  # functions.exportpublickeyGPGme(email)
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

	end

#******* Main() ********
#PARAMS
name = "gpgmetestuser"
email = "gpgmetestuser@encryptomail.xyz"
passphrase = "hry785jB"
#TESTS
puts EmailApp::EncryptomailUnitTests.testGPGmekeygen(name, email, passphrase)
puts EmailApp::EncryptomailUnitTests.testGPGmeexportpublickey(email)
puts EmailApp::EncryptomailUnitTests.testprivatekeyexport(email)
puts EmailApp::EncryptomailUnitTests.testGPGmelistkeys()
#puts EmailApp::EncryptomailUnitTests.testkeydeletion("someguy@me.com")
end
