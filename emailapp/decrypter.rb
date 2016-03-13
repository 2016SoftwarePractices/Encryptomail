
module EmailApp

require 'rubygems'
require 'openpgp'

class EmailApp::Decrypter
    
    #This method will receive an email and a passphrase from the user registration view
    def self.generatePGPkey (name, email, passphrase)
        
        gpg = OpenPGP::Engine::GnuPG.new(:homedir => '~/.gnupg')
        
        key_id = gpg.gen_key({
        :key_type      => 'RSA',
        :key_length    => 4096,
        :subkey_type   => 'ELG-E',
        :subkey_length => 1024,
        :name          => name,
        :comment       => nil,
        :email         => email,
        :passphrase    => passphrase,
        })
        return key_id
    end
    
    def self.commandLinePGPkeygen (name, email, passphrase)
        
    end
    
    def decryptPGP (toBeDecrypted)
        require 'open-uri'
        msg = OpenPGP::Message.parse(OpenPGP.dearmor(toBeDecrypted))
        return msg
    end
    
end