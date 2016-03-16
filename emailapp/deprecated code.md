= Deprecated Code from Encryptomail Project    		
    		
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