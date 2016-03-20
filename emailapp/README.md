# Encryptomail::EmailApp

* We assume that an SMTP email server is available - such as PostFix. 
    * Set-up, configuration, and Administration are outside the scope of this software. 
    * Take neccessary precautions to insure that your server instance is secure enough to host a service of this nature.

## Encryptomail string formats:
```
fields = <GnupgKeyParms format="internal">
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
```
