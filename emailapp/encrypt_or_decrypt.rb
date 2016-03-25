# Author jeff@jefflazerus.com

module EmailApp
    
    class EncryptOrDecrypt
    
        def self.encryptMailString(message, email)
            puts "Attempting to encrypt an email string for #{email}"
            crypto = GPGME::Crypto.new :armor => true, :always_trust => true
            encrypted = crypto.encrypt(message) 
            puts encrypted
        end
        
        def self.decryptMailString(message)
            puts "Attempting to decrypt an email string"
            crypto = GPGME::Crypto.new :armor => true, :always_trust => true
            #TODO message = email, password = somevar
            decrypted = crypto.decrypt(message, :password => 'GetYourOwnDamnPassword!')
            puts decrypted
        end
    
    end

end
