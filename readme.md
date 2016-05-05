![logo](https://github.com/2016SoftwarePractices/Encryptomail/blob/master/webapp/public/EncryptologoSml.png)

CS4260 - Software Engineering Practices

Metropolitan State University of Denver, 2016

---

### /webapp - Website code
*   Ruby on Rails App to run the web portal for user registration and group management
* Frontend
    * Devise:  
        *  A frontend module for running session and user authentication/authorization
    * MaterializeCSS:  
        *  Frontend module for creating good looking CSS


### /webapp/lib - Application code
* Ruby app to run the mail redirection service
* Key generation requires entropy on your server. Here's a good guide to help out with that: https://www.digitalocean.com/community/tutorials/how-to-setup-additional-entropy-for-cloud-servers-using-haveged
* Check your entropy with the following (Linux only):
```
    cat /proc/sys/kernel/random/entropy_avail
```
* The number returned should be > 1000, otherwise, key generation may not work.

### PGP Encryption
* GnuPG
    * https://wiki.gnupg.org/APIs
    * This is the Open Source PGP project GnuPG

* GPGme
    * https://github.com/ueno/ruby-gpgme.git
    * This is the GnuPG official Ruby gem for Ruby implementation of GnuPG
    * $ sudo gem install gpgme
    * Keys generated are saved to the Linux keyring
    * Good Examples: http://irtfweb.ifa.hawaii.edu/~lockhart/gpg/

* NOTE: 
    *  In order to get quick key generation use rng-tools, instructions to set this up are located here:         
    *  https://www.howtoforge.com/helping-the-random-number-generator-to-gain-enough-entropy-with-rng-tools-debian-lenny)

# Encryptomail::EmailApp

* We assume that an SMTP email server is available - such as PostFix. 
    * Set-up, configuration, and Administration are outside the scope of this software. 
    * Take neccessary precautions to insure that your server instance is secure enough to host a service of this nature.

### Encryptomail string formats:
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
### Import, verify, and sign a public key for testing:
* You can use the test key we provide on the MIT keyserver for a group: test_unlocked_group_1@encryptomail.xyz using the following command line arguments, after installing gpg on your local environment. This set of commands was tested on OS X 10.10.5.
### Import the public key
    gpg --keyserver pgp.mit.edu  --search-keys test_unlocked_group_1@encryptomail.xyz
### Verify the public key
    gpg --fingerprint test_unlocked_group_1@encryptomail.xyz
* should return the following:
```
pub   4096R/B9AA79AB 2016-02-26
      Key fingerprint = AE19 DFF7 73FD 22EF 4D90  92A3 1806 4C09 B9AA 79AB
uid                  test_unlocked_group_1 <test_unlocked_group_1@encryptomail.xyz>
sub   4096R/5487B4BF 2016-02-26
```
### Sign the public key
* You will probably have multiple keys. Sign the imported key with the uid of a trusted group as follows:
```
gpg --sign-key -u testgroup@helloworld.com test_unlocked_group_1@encryptomail.xyz
``` 

# Web Application Setup

### Required Modules
* Apache
    * ```version -> 2.4.18-1```
* Passenger
    * ```version -> 5.0.23```
* RVM
    * ```version -> 1.26.11```
* Ruby
    * ```version -> 2.2.1p85```
* Rails
    * ```version -> 4.2.5.1```
    * http://api.rubyonrails.org/
* Mongoid - Database
    * ```version -> 5.1.0```
    * https://docs.mongodb.org/ecosystem/tutorial/ruby-mongoid-tutorial/
    * http://requiremind.com/riding-rails-4-along-with-mongoid-and-ruby-2-dot-0/
* Devise - User Authentication and Session Handling
    * http://suvankar.svbtle.com/devise-and-mongoid-in-rails-4
* Materialize - CSS and HTML framework
    * http://materializecss.com/

### Linux
* We assume that an email server is available. Set-up, configuration, and Administration are outside the scope of this software. Take neccessary precautions to insure that your server instance is secure enough to host a service of this nature. 
* Make a directory for the project
    * mkdir Encryptomail
* Clone the git repo into the directory
    * git clone https://github.com/2016SoftwarePractices/Encryptomail.git Encryptomail
* If you haven't installed mongodb you will need to
    * Ubuntu
        * apt-get install mongodb
    * Arch
        * pacman -S mongodb
* Ensure that mongodb service is running
    * Arch
        * systemctl enable mongodb.service
        * systemctl start mongodb.service
    * Ubuntu
        * service mongodb start
    * Ubuntu upstart
        * start mongodb
* You should now be able to run the mongo shell to ensure the service is running
    * mongo
* Move into the Encryptomail directory you created
    * cd Encryptomail/
* Run bundle
    * bundle install
* Serve the rails project
    * rails s

### Cloud9
* Pull code in from git 
* Run bundle, this downloads all the gems that we are currently using
    * bundle install
* Setup the local mongo database for C9. Navigate to the /webapp folder, then do:
    * mongod --dbpath=data --rest --smallfiles "$@"
* Run Rails
    * rails s -b $IP -p $PORT

### Recaptcha
* For testing recaptcha on your machine you are going to first want to generate keys from google at:
```
    https://www.google.com/recaptcha/

    Then you will need to (in Linux) export your public and private keys:

    export RECAPTCHA_PUBLIC_KEY="6Lc6BAAAAAAAAChqRbQZcn_yyyyyyyyyyyyyyyyy"

    export RECAPTCHA_PRIVATE_KEY="6Lc6BAAAAAAAAKN3DRm6VA_xxxxxxxxxxxxxxxxx"

    After that you should be ready to serve stuff up to localhost and test it out.

    This github project was helpful in the setup https://github.com/ambethia/recaptcha
```
* With the following test keys, you will always get No CAPTCHA and all verification requests will pass.
```
    Site key: 6LeIxAcTAAAAAJcZVRqyHh71UMIEGNQ_MXjiZKhI
    
    Secret key: 6LeIxAcTAAAAAGG-vFI1TnRWxMZNFuojJ4WifJWe
```   
* The reCAPTCHA widget will show a warning message to claim that it's only for testing purpose. Please do not use these keys for your production traffic.
