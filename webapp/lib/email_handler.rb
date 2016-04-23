#
#    Email handling and PGP key functions
#    This is the core business logic of the Encryptomail application
#

module EmailApp
    
    class Email_handler
		
            #Method to generate a PGP keypair
            #(String name, String email, String passphrase)
    	def self.generatePGPkeyGPGme(name, email, passphrase)
            puts "Attempting to create a PGP keypair via GPGme for #{name}, #{email}"
            ctx = GPGME::Ctx.new()
            # Build the params block, and generate the keys
            fields = buildparamsblock(name, email, passphrase)
            # If pubkey and seckey are both set to nil, it stores the generated key pair into your key ring.
            ctx.generate_key(fields, nil, nil)
            # KEY IS NOT RETURNED, it is added to the Linux local keychain
    	end
    	
    	
    	    #Method to export a public key by email address
        def self.exportpublickeyGPGme(email)
            puts "Attempting to export public key via GPGme for #{email}"
            pub_key = GPGME::Key.find(:public, "#{email}")
            # pub_key IS AN ARRAY OF GPGME::DATA OBJECTS
            data = pub_key.first.export(:armor => true)
            return data.to_s
        end
		
		
		
		  #Method to export a private key by email address
		def self.exportprivatekey(email)
            puts "Attempting to export private key for #{email}"
            pri_key = `gpg --export-secret-key --armor "#{email}"`
            puts pri_key.to_s
		end
		
		
		
		      #Method lists public keys to the Linux terminal
        def self.listallpublickeys()
            puts "Attempting to list all public keys in the Linux keychain"
            puts "***PUBLIC KEYS***"
            pub_key_list = `gpg --list-keys`
            puts pub_key_list.to_s
        end
	      
	      
	      
	            #Method lists private keys to the Linux terminal
        def self.listallprivatekeys()
            puts "Attempting to list all private keys in the linux keychain"
            puts "***PRIVATE KEYS***"
            pri_key_list = `gpg --list-secret-keys`
            puts pri_key_list.to_s
        end
        
        
        
            #Method deletes both public and private keys for a user
    	def self.deletekey(email)
    		puts "Attempting to delete public key for: #{email}"
    		pub_key = GPGME::Key.find(:public, "#{email}")
    		ctx = GPGME::Ctx.new()
    		ctx.delete_key(pub_key[0], allow_secret = true)
    	end
        
            #Method imports a either a public or private key to the Linux keychain
            #pubkey must be a string
        def self.importkey(pubkey)
            puts "Attempting to import public key #{pubkey}"
            GPGME::Key.import(pubkey)
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
            crypto = GPGME::Crypto.new :armor => true, :always_trust => true
            encrypted = crypto.encrypt(message, :recipients => email)
            return encrypted
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
            email_size = File.size(message)
            bytesToMeg(email_size) #prints out size of email in Megabytes.
        end


        MEGABYTE = 1024.0 * 1024.0
        # method to convert bytes to megabytes
        def self.bytesToMeg bytes
              bytes /  MEGABYTE
        end
        
        ############################################
        ####### Base Email Handling Code ###########
        ##Method takes email in as raw string, with headers and ASCII armor
        def self.email_handler (rawEmail)
            passphrase = "hry785jB"
            matches = rawEmail.match(/^To: .*/)
            puts "\n'To:' line match: " + matches[0]
            groupEmailAddress = matches[0].split(" ")
            puts "\nParsed out group email: " + groupEmailAddress[1]
            decryptedMessage = EmailApp::Email_handler.decryptMailString(rawEmail, passphrase)
            print "\n"
            puts decryptedMessage
            EmailApp::sendLoop(decryptedMessage, groupEmailAddress)
        end
        
        
        
        def self.sendLoop(plaintextEmail, groupEmailAddress)
            #groupMemberList = Find members of groupEmailAddress
            groupObject = EmailApp::Email_handler.group_lookup(groupEmailAddress)
            print "\n"
            puts Group.all
            if(groupObject == nil)
                print "\n"
                puts "Group not found\n"
                return
            end
            groupObject.users.each do |user|
                userSpecificEncryptedEmail = EmailApp::Email_handler.encryptMailString(plaintextEmail, user)
                EmailApp::Email_handler.send(userSpecificEncryptedEmail, user)
            end
        end
        
            #Takes the encrypted content, and a User object as params
        def self.send(encryptedEmail, user)
            puts "IMPLEMENT ME - Tried to send a message, but you haven't written my code yet!"
            #Do stuff - send to postfix somehow
        end
        
        
        #******************************************#
        #**********Class Helper Function**********#
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
        #******************************************#
        #**********Class Helper Function**********#
    
    end
    
end