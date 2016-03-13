require 'rubygems'
require 'gpgme'
require 'openpgp'
require 'open-uri'
load 'encryptomail.rb'

module EmailApp

	class EmailApp::EncryptomailUnitTests

    		def self.testGPGmekeygen()
        		puts "TEST: Attempting to test the creation and export of a key using GPGme"
        		puts "(GPGme) Trying to generate PGP key - this may take a while: "
        		key_string = EmailApp::Encryptomail.generatePGPkeyGPGme('GPGmetestuser', 'gpgmetestuser@test.com', 'H5giu)(*')
        		puts key_string
        		puts "GPGme has successfully created a new keypair for GPGmetestuser"
    		end
    		
    		def self.testGPGmeexport()
    			puts "Attempting to export public key for GPGmetestuser"
    			# ctx = GPGME::Ctx.new()
       			# pub_key_string = ctx.export_keys("GPGmetestuser")
       			# out = File.open("GPGmetestuser.key", "w+")
       			pub_key = GPGME::Key.find(:public, "gpgmetestuser@test.com")
       			# pub_key IS AN ARRAY OF GPGME::DATA OBJECTS
       			data = pub_key.first.export(:armor => true)
        		data.to_s
    		end
    		
    		
    		# def self.testOpenPGPkeygen()
      #  		puts "TEST: Attempting to test the creation and export of a key using OpenPGP"
      #  		puts "(OpenPGP) Trying to generate PGP key - this may take a while: "
      #  		key_string = EmailApp::Encryptomail.generatePGPkeyOpenPGP('OpenPGPtestuser', 'OpenPGPtestuser@test.com', '12345QQqa')
      #  		puts key_string
      #  		puts "OpenPGP has successfully created a new keypair for OpenPGPtestuser"
    		# end
    		
    		# def self.testOpenPGPexport()
    		# 	puts "Attempting to export public key for OpenPGPtestuser"
    		# 	gpg = OpenPGP::Engine::GnuPG.new(:homedir => '~/.gnupg')
    		# 	pub_key_string = gpg.export("OpenPGPtestuser") #This line uses deprecated methods, cannot be used
    		# 	print pub_key_string.to_s
    		# end
	end

# Main()
# EncryptomailUnitTests.testGPGmekeygen
EncryptomailUnitTests.testGPGmeexport()

# EncryptomailUnitTests.testOpenPGPkeygen()
# EncryptomailUnitTests.testOpenPGPexport()

end
