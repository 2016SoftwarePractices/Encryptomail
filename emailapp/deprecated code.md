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

messageToDecrypt = "-----BEGIN PGP MESSAGE-----
Version: GnuPG v1

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
=Sl+Y
-----END PGP MESSAGE-----"