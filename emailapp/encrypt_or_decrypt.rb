# Author jeff@jefflazerus.com

module EmailApp
    
    class EncryptOrDecrypt
    
        def self.encryptMailString(message, email)
            puts "Attempting to encrypt an email string for #{email}"
            crypto = GPGME::Crypto.new :armor => true, :always_trust => true
            encrypted = crypto.encrypt(message) 
            return encrypted
        end
        
        def self.decryptMailString(message, passphrase)
            puts "Attempting to decrypt an email string"
            crypto = GPGME::Crypto.new :armor => true, :always_trust => true
            decrypted = crypto.decrypt(message, :password => passphrase)
            return decrypted
        end
    
    end

end
