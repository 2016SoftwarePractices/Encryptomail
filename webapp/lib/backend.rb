#
#    PGP key functions
#    This is the core business logic of the Encryptomail application
#
require 'gpgme'


class Backend
	
		#String builder for the parameter block used in key generation
	def self.buildparamsblock(name, email, passphrase)
        block = []
        block << '<GnupgKeyParms format="internal">'
        block << 'Key-Type: DSA'
        block << 'Key-Length: 4096'
        block << 'Subkey-Type: ELG-E'
        block << 'Subkey-Length: 1024'
        block << "Name-Real: #{name}"
        block << 'Name-Comment: Includes passphrase'
        block << "Name-Email: #{email}"
        block << 'Expire-Date: 0'
        block << "Passphrase: #{passphrase}"
        block << '</GnupgKeyParms>'
        return block.join("\n")
    end
    
        #Method to generate a PGP keypair
        #(String name, String email, String passphrase)
	def self.generatePGPkey(name, email, passphrase)
        ctx = GPGME::Ctx.new()
        fields = buildparamsblock(name, email, passphrase)
        ctx.generate_key(fields, nil, nil)
        # KEY IS NOT RETURNED, it is added to the Linux local keychain
	end
	
	
	    #Method to export a public key by email address
    def self.exportpublickey(email)
        pub_key = GPGME::Key.find(:public, "#{email}")
        # pub_key IS AN ARRAY OF GPGME::DATA OBJECTS
        data = pub_key.first.export(:armor => true)
        return data.to_s
    end
	
	
	
	  #Method to export a private key by email address
	def self.exportprivatekey(email)
        pri_key = `gpg --export-secret-key --armor "#{email}"`
        return pri_key
	end
	
	
	
		#Method lists public keys to the Linux terminal
    def self.listallpublickeys()
        pub_key_list = `gpg --list-keys`
        return pub_key_list.to_s
    end
    
    
        #Method lists private keys to the Linux terminal
    def self.listallprivatekeys()
        pri_key_list = `gpg --list-secret-keys`
        return pri_key_list.to_s
    end
    
    
        #Method deletes both public and private keys for a user
	def self.deletekey(email)
		pub_key = GPGME::Key.find(:public, "#{email}")
		ctx = GPGME::Ctx.new()
		ctx.delete_key(pub_key[0], allow_secret = true)
	end
    
        #Method imports a either a public or private key to the Linux keychain
        #pubkey must be a string
    def self.importkey(pubkey)
        GPGME::Key.import(pubkey)
    end
    
    	#Method to delete ALL user keys in the linux keychain
    	#Use with...caution
    def self.nuke()
    		#list all keys, parse emails, iterate through parse array with calls to deletekey(email)
    	list = listallprivatekeys()
    	matches = list.scan(/<.*>/)
    	puts matches
    	matches.each do |match|
    		match[0] = ""
    		match[match.length - 1] = ""
    		puts match
    		deletekey(match)
    	end
    end
    
    
        #Checks the DB for the group containing a specific email address
    def self.group_lookup(email)
        if (Group.where(email: email).exists?)
            return Group.find_by(email: email) 
        else
            return nil
        end
    end
    
    #*********************************************************
    #*********Encryption and Decryption methods***************
    
    def self.encryptMailString(message, email)
		begin
		crypto = GPGME::Crypto.new :armor => true, :always_trust => true
			encrypted = crypto.encrypt(message, :recipients => email)
			return encrypted
		rescue Exception => e
		puts e.message
		puts e.backtrace.inspect
		end
    end
      
    def self.decryptMailString(message, passphrase)
        crypto = GPGME::Crypto.new :armor => true, :always_trust => true
        decrypted = crypto.decrypt(message, :password => passphrase)
        return decrypted
    end
    
    #**************************************************
    #**************email size checker code*************
    # method to check the size of an email
    def self.check_email_size(message)
        email_size = message.size
        bytesToMeg(email_size) #prints out size of email in Megabytes.
    end


    MEGABYTE = 1024.0 * 1024.0
    # method to convert bytes to megabytes
    def self.bytesToMeg bytes
          bytes /  MEGABYTE
    end

end