require 'rubygems'
require 'gpgme'
require 'open-uri'
load 'keygenerator.rb'

class KeyGeneratorTests
   
    def self.testKeyGenCreate(name, email, passphrase)
        KeyGenerator::generatePGPkeyGPGme(name, email, passphrase)
    end

##******* Main() ********
##TEST SET 1 PARAMS
name = "test1"
email = "test1@encryptomail.xyz"
passphrase = "hry785jB"

##MAIN##
self.testKeyGenCreate(name, email, passphrase)
end