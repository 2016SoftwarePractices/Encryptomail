require 'rubygems'
require 'gpgme'
require 'open-uri'

	class KeyGenerator
		# generate_key(parms, pubkey = Data.new, seckey = Data.new)
		def self.generatePGPkeyGPGme(name, email, passphrase)
    		puts("-----------------------------------------Before ctx--------------------------------------")
    		ctx = GPGME::Ctx.new()
    		puts("---------------------------------AFter ctx creation----------------------------------------------")
    		# Generate a new key pair. parms is a string which looks like:
    		fields = '<GnupgKeyParms format="internal">
                		Key-Type: DSA
                		Key-Length: 4096
                		Subkey-Type: ELG-E
                		Subkey-Length: 1024
                		Name-Real: GPGmetestuser
                		Name-Comment: Includes passphrase
                		Name-Email: polarbear6@gmail.com
                		Expire-Date: 0
                		Passphrase: 666gggqqq
                		</GnupgKeyParms>'
    		# If pubkey and seckey are both set to nil, it stores the generated key pair into your key ring.
    		ctx.generate_key(fields, nil, nil)
    		puts("----------------------------------after ctx generation---------------------------------------------")
            exportpublickeyGPGme(email)
            puts("--------------------------------------after export-----------------------------------------")
    		# Key IS NOT RETURNED, it is added to the Linux local keychain
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
    		
# 		def self.generatePGPkeyOpenPGP (name, email, passphrase)
    
#     		gpg = OpenPGP::Engine::GnuPG.new(:homedir => '~/.gnupg')
    
#     		key_id = gpg.gen_key({
#     		:key_type      => 'RSA',
#     		:key_length    => 4096,
#     		:subkey_type   => 'ELG-E',
#     		:subkey_length => 1024,
#     		:name          => name,
#     		:comment       => nil,
#     		:email         => email,
#     		:passphrase    => passphrase,
#     		})
#     		return key_id
# 		end
end


# fields = '<GnupgKeyParms format="internal">
      #          		Key-Type: DSA
      #          		Key-Length: 1024
      #          		Subkey-Type: ELG-E
      #          		Subkey-Length: 1024
      #          		Name-Real: Ross Baldwin
      #          		Name-Comment: with stupid passphrase
      #          		Name-Email: joe@foo.bar
      #          		Expire-Date: 0
      #          		Passphrase: abc
      #          		</GnupgKeyParms>'