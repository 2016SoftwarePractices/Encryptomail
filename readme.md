# Software Engineering Practices - CS4260

---

## There are two apps in this project that are intended to be run side-by-side

### webapp 
*   Ruby on Rails App to run the web portal for user registration and group management

##### Frontend
* Devise
    * A frontend module for running session and user authentication/authorization

* MaterializeCSS
    * Frontend module for creating good looking CSS


### emailapp
* Ruby app to run the mail redirection service
	
	
####PGP Encryption
* GnuPG
    * https://wiki.gnupg.org/APIs
    * This is the Open Source PGP project GnuPG

* GPGme
    * https://github.com/ueno/ruby-gpgme.git
    * This is the GnuPG official Ruby gem for Ruby implementation of GnuPG
    * $ sudo gem install gpgme
    * Keys generated are saved to the Linux keyring
    * Good Examples: http://irtfweb.ifa.hawaii.edu/~lockhart/gpg/

* OpenPGP Ruby Gem - https://github.com/bendiken/openpgp
    * This is a ruby gem which implements GnuPG encryption
    * $ sudo gem install openpgp (Ruby 1.8.7+ or 1.9.x)
    * $ sudo gem install backports openpgp (Ruby 1.8.1+)
    * $ gpg -help (This lists all of the GPG commands on Linux)
    * Keys generated are saved to the Linux keyring