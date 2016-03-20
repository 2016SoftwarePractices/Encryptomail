# Author jeff@jefflazerus.com

module EmailApp
    
    class Encrypt
    
        def self.encryptMailString(message, email)
            puts "Attempting to encrypt an email string for #{email}"
            crypto = GPGME::Crypto.new :armor => true, :always_trust => true
            encrypted = crypto.encrypt(message) 
            puts encrypted
        end
    
    end

end