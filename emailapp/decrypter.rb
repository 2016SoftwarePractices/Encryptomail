require 'rubygems'
require 'openpgp'

class Decrypter
    
    def main
        puts "HI"
    end

    
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
    
    
    
    def decryptPGP (toBeDecrypted)
        require 'open-uri'
        # text = open('http://openpgp.rubyforge.org/pgp.txt').read
        text = open(toBeDecrypted).read
        msg = OpenPGP::Message.parse(OpenPGP.dearmor(text))
        return msg
    end

   
    
end

puts "heres some shit"
key_string = Decrypter.generatePGPkey('gofuckyourself', 'fuck@you.com', '12345')
puts key_string