require 'rubygems'
require 'gpgme'
load 'encryptomail.rb'

module EmailApp

	class EncryptomailUnitTests

    		def self.testGPGmekeygen()
      		puts "TEST: Attempting to test the creation of a key using GPGme"
      		puts "(GPGme) Trying to generate PGP key - this may take a while: "
      		key_string = EmailApp::Encryptomail.generatePGPkeyGPGme('GPGmetestuser', 'gpgmetestuser@test.com', 'H5giu)(*')
      		puts key_string
      		puts "GPGme has successfully created a new keypair for GPGmetestuser"
    		end
    		
    		def self.testGPGmeexportpublickey(email)
    		  puts "TEST: Attempting to export public key for #{email}"
    		  # functions = Encryptomail.new
    		  # functions.exportpublickeyGPGme(email)
     			EmailApp::Encryptomail.exportpublickeyGPGme(email)
    		end
    		
    		def self.testGPGmelistkeys()
    			puts "Attempting to list all keys in the Linux keychain"
     			pri_key = GPGME::Key.find :public
     			  # pub_key IS AN ARRAY OF GPGME::DATA OBJECTS
     			pri_key.each do |key|
     				data = key.export(:armor => true)
     				data.to_s
     			end
    		end
	end

# Main()
# EncryptomailUnitTests.testGPGmekeygen
puts EmailApp::EncryptomailUnitTests.testGPGmeexportpublickey("gpgmetestuser@test.com")
puts EmailApp::EncryptomailUnitTests.testGPGmelistkeys()

end
