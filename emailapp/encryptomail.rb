require 'rubygems'
require 'gpgme'
require 'openpgp'
require 'open-uri'

module EmailApp

	class EmailApp::Encryptomail
		
		# generate_key(parms, pubkey = Data.new, seckey = Data.new)
		def self.generatePGPkeyGPGme(name, email, passphrase)
    		ctx = GPGME::Ctx.new()
    		# Generate a new key pair. parms is a string which looks like:
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
    		# Key IS NOT RETURNED, it is added to the Linux local keychain
		end
		
		def self.generatePGPkeyOpenPGP (name, email, passphrase)
    
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
	end
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