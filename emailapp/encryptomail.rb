# require 'rubygems'
# require 'gpgme'
# require "../webapp/config/environment"

module EmailApp

	class Encryptomail
		
	      	# generate_key(parms, pubkey = Data.new, seckey = Data.new)
		def self.generatePGPkeyGPGme(name, email, passphrase)
		      puts "Attempting to create a PGP keypair via GPGme for #{name}, #{email}"
          		ctx = GPGME::Ctx.new()
          		      # Generate a new key pair. parms is a string which looks like:
          		      #*******************TODO*********************
          		      #The string below needs to accept the method parameters, and not be hard-coded data
          		fields = '<GnupgKeyParms format="internal">
                      		Key-Type: DSA
                      		Key-Length: 4096
                      		Subkey-Type: ELG-E
                      		Subkey-Length: 1024
                      		Name-Real: GPGmetestuser
                      		Name-Comment: Includes passphrase
                      		Name-Email: gpgmetestuser@test.com
                      		Expire-Date: 0
                      		Passphrase: 666gggqqq
                      		</GnupgKeyParms>'
          		      # If pubkey and seckey are both set to nil, it stores the generated key pair into your key ring.
          		ctx.generate_key(fields, nil, nil)
    		            # KEY IS NOT RETURNED, it is added to the Linux local keychain
		end
		
		def self.exportpublickeyGPGme(email)
    			puts "Attempting to export public key via GPGme for #{email}"
 			pub_key = GPGME::Key.find(:public, "#{email}")
 			      # pub_key IS AN ARRAY OF GPGME::DATA OBJECTS
 			data = pub_key.first.export(:armor => true)
        		data.to_s
              		#*******************TODO*********************
              		#pub_key needs to be stored in the DB here
              		#"data" above is just a string, and can be stored directly
    		end
    		
            def self.group_lookup(email)
                  if (Group.where(email: email).exists?) 
                    Group.find_by(email: email) 
                  else 
                    nil
                  end
            end
	end
end