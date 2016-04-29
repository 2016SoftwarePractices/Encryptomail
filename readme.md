[logo]: https://github.com/2016SoftwarePractices/Encryptomail/blob/master/webapp/public/mstile-144x144.png
# ![logo] *Encryptomail* 
* CS4260 - Software Engineering Practices
* Metropolitan State University of Denver, 2016

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

#### PGP Encryption
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
