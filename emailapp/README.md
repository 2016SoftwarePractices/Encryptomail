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
## Import, verify, and sign a public key for testing:
You can use the test key we provide on the MIT keyserver for a group: test_unlocked_group_1@encryptomail.xyz using the following command line arguments, after installing gpg on your local environment. This set of commands was tested on OS X 10.10.5.
#### Import the public key
    gpg --keyserver pgp.mit.edu  --search-keys test_unlocked_group_1@encryptomail.xyz
#### Verify the public key
    gpg --fingerprint test_unlocked_group_1@encryptomail.xyz
should return the following:
```
pub   4096R/B9AA79AB 2016-02-26
      Key fingerprint = AE19 DFF7 73FD 22EF 4D90  92A3 1806 4C09 B9AA 79AB
uid                  test_unlocked_group_1 <test_unlocked_group_1@encryptomail.xyz>
sub   4096R/5487B4BF 2016-02-26
```
#### Sign the public key
You will probably have multiple keys. Sign the imported key with the uid of a trusted group as follows:
    gpg --sign-key -u testgroup@helloworld.com test_unlocked_group_1@encryptomail.xyz
