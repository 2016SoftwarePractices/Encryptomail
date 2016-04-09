# require 'rubygems'
# require 'gpgme'
# require "../webapp/config/environment"

#Written by P. Ross Baldwin

module EmailApp

	class Encryptomail
		
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
        		data.to_s
        		      # KEY IS NOT RETURNED - it is added to the linux keychain only!
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
                  # pub_key = GPGME::Key.find :public
                  #  # pub_key IS AN ARRAY OF GPGME::DATA OBJECTS
                  # pub_key.each do |pubkey|
                  #     data = pubkey.export(:armor => true)
                  #     puts data.to_s
                  # end
            end
    	      
    	      
    	      
    	            #Method lists private keys to the Linux terminal
            def self.listallprivatekeys()
                  puts "Attempting to list all private keys in the linux keychain"
                  puts "***PRIVATE KEYS***"
                  pri_key_list = `gpg --list-secret-keys`
                  puts pri_key_list.to_s
            end
            
            
            
                  #Method deletes both public and private keys for a user
                  #BUGGED - REQUIRES INPUT FROM THE CONSOLE
            def self.deleteuserkeys(email)
                  puts "Attempting to delete public and private keys for #{email}"
                  output = `gpg --delete-secret-key "#{email}"`
                  puts output.to_s
                  output = `gpg --delete-keys "#{email}"`
                  puts output.to_s
                  # ctx = GPGME::Ctx.new()
                  # output = ctx.delete_key(email, true)
                  # puts output.to_s
            end
    		
    		
    		
    		
            def self.group_lookup(email)
                  if (Group.where(email: email).exists?) 
                    Group.find_by(email: email) 
                  else 
                    nil
                  end
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
            
            
            #*********************************************************
            #*********Encryption and Decryption methods***************
            
            def self.encryptMailString(message, email)
                  crypto = GPGME::Crypto.new :armor => true, :always_trust => true
                  encrypted = crypto.encrypt(message) 
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
            
	end
end