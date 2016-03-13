
module EmailApp

require 'rubygems'
require 'gpgme'
require 'openpgp'

class EmailApp::EncryptomailUnitTests

    def self.testGPGme()
        puts "TEST: Attempting to test the creation and export of a key using GPGme"
        ctx = GPGME::Ctx.new()
        puts "(GPGme)Trying to generate PGP key - this may take a while: "
        encryptomail = Encryptomail.new()
        key_string = encryptomail.generatePGPkey()
        puts key_string
        puts "Attempting to export public key for Ross Baldwin"
        pub_key_string = ctx.export_keys("Ross Baldwin")
        puts pub_key_string
    end
    
    
    def self.testOpenPGP()
        puts "TEST: Attempting to test the creation and export of a key using OpenPGP"
        gpg = OpenPGP::Engine::GnuPG.new(:homedir => '~/.gnupg')
        puts "(OpenPGP)Trying to generate PGP key - this may take a while: "
        key_string = EmailApp::Decrypter.generatePGPkey('Some Guy 2', 'someguy2@me.com', '12345')
        puts key_string
        msg = gpg.export(key_string)
        puts msg
    end
end

# Main()

test EncryptomailUnitTests.testOpenPGP
test EncryptomailUnitTests.testGPGme
end