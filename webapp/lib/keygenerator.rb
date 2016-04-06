require 'rubygems'
require 'gpgme'
require 'open-uri'

class KeyGenerator
	
	def self.generatePGPkeyGPGme(name, email, passphrase)
		puts "Attempting to create a PGP keypair via GPGme for #{name}, #{email}"
		ctx = GPGME::Ctx.new()
		
		# Build the params block, and generate the keys
		fields = buildparamsblock(name, email, passphrase)
		
		# If pubkey and seckey are both set to nil, it stores the generated key pair into your key ring.
		# KEY IS NOT RETURNED, it is added to the Linux local keychain
		ctx.generate_key(fields, nil, nil)
	end

	#Method to export a public key by email address
	def self.exportpublickeyGPGme(email)
		puts "Attempting to export public key via GPGme for #{email}"
		# pub_key IS AN ARRAY OF GPGME::DATA OBJECTS
		pub_key = GPGME::Key.find(:public, "#{email}")
		
		data = pub_key.first.export(:armor => true)
		data.to_s
		#*******************TODO*********************
		#pub_key needs to be stored in the DB here
		#"data" above is just a string, and can be stored directly
		#or, this can be stored in the DB on the webapp calling side
	end

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
	
end