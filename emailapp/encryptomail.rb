
module EmailApp

require 'rubygems'
require 'gpgme'

class EmailApp::Encryptomail
    
# generate_key(parms, pubkey = Data.new, seckey = Data.new)
# Generate a new key pair. parms is a string which looks like

#  <GnupgKeyParms format="internal">
#  Key-Type: DSA
#  Key-Length: 1024
#  Subkey-Type: ELG-E
#  Subkey-Length: 1024
#  Name-Real: Joe Tester
#  Name-Comment: with stupid passphrase
#  Name-Email: joe@foo.bar
#  Expire-Date: 0
#  Passphrase: abc
#  </GnupgKeyParms>
# If pubkey and seckey are both set to nil, it stores the generated key pair into your key ring.

    def self.generatePGPkey()
        ctx = GPGME::Ctx.new()
        
        fields = '<GnupgKeyParms format="internal">
                    Key-Type: DSA
                    Key-Length: 1024
                    Subkey-Type: ELG-E
                    Subkey-Length: 1024
                    Name-Real: Ross Baldwin
                    Name-Comment: with stupid passphrase
                    Name-Email: joe@foo.bar
                    Expire-Date: 0
                    Passphrase: abc
                    </GnupgKeyParms>'
        
        ctx.generate_key(fields, nil, nil)
        # Key IS NOT RETURNED, it is added to the Linux local keychain
    end
end
