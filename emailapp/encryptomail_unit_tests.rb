require 'rubygems'
require 'gpgme'
load 'encryptomail.rb'

module EmailApp

	class EncryptomailUnitTests


          #test PGP keypair generation
    		def self.testGPGmekeygen(name, email, passphrase)
      		puts "TEST: Attempting to test the creation of a key using GPGme"
      		puts "(GPGme) Trying to generate PGP key - this may take a while: "
      		key_string = EmailApp::Encryptomail.generatePGPkeyGPGme(name, email, passphrase)
      		puts key_string
      		puts "GPGme has successfully created a new keypair for #{email}"
    		end
    		
    		
    		  #test public key export
    		def self.testGPGmeexportpublickey(email)
    		  puts "TEST: Attempting to export public key for #{email}"
     			EmailApp::Encryptomail.exportpublickeyGPGme(email)
    		end
    		
    		
            #test private key export
    		def self.testprivatekeyexport(email)
    		    puts "TEST: Attempting to export private key for gpgmetestuser@test.com"
    		    EmailApp::Encryptomail.exportprivatekey(email)
    		end
    		
    		
    		#test key listing
    		def self.testGPGmelistkeys()
    			EmailApp::Encryptomail.listallpublickeys()
    			EmailApp::Encryptomail.listallprivatekeys()
    		end
    		
    		
    		def self.testkeydeletion(email)
    		  EmailApp::Encryptomail.deleteuserkeys(email)
    		end
    		
    		
    		#test encrypting simple message
    		def self.testEncryptMailString(message, email)
      		puts "TEST: Attempting to test encrypting a message using GPGme"
      		encrypted = EmailApp::Encryptomail.encryptMailString(message, email)
      		puts "GPGme has successfully encrypted a message for #{email}"
      		return encrypted
    		end
    		
    		
    		#test decrypting simple message
    		def self.testDecryptMailString(messageToDecrypt, passphrase)
      		puts "TEST: Attempting to test decrypting a message using GPGme"
      		decrypted = EmailApp::Encryptomail.decryptMailString(messageToDecrypt, passphrase)
      		puts "GPGme has successfully decrypted the message"
      		return decrypted
    		end
    		
    		#Test email size function
    		def self.testEmailSize(email)
    		    puts "TEST: Verifying email size"
    		    size = EmailApp::Encryptomail.check_email_size(email)
    		    return size
    		end

	end

##******* Main() ********
##TEST SET 1
##PARAMS
name = "gpgmetestuser"
email = "gpgmetestuser@encryptomail.xyz"
passphrase = "hry785jB"
##TEST SET 1 
#puts EmailApp::EncryptomailUnitTests.testGPGmekeygen(name, email, passphrase)
#puts EmailApp::EncryptomailUnitTests.testGPGmeexportpublickey(email)
#puts EmailApp::EncryptomailUnitTests.testprivatekeyexport(email)
#puts EmailApp::EncryptomailUnitTests.testGPGmelistkeys()


##TEST SET 2
##PARAMS

message = "Ned: Are you now or have you ever been a Norse God,\n
Vampire, or Time Traveling Cyborg?\n
Mike O' Donnell: I've known you since what, first grade?\n
I think that maybe I would have told you!\n
Ned Freedman: Vampire wouldn't tell, Cyborg wouldn't know."

rawEmail_NoArmor = "Return-Path: <pi@encryptomail.xyz>
X-Original-To: gpgmetestuser@encryptomail.xyz
Delivered-To: gpgmetestuser@encryptomail.xyz
Received: by mail.encryptomail.xyz (Postfix, from userid 1001)
        id A27401606A4; Mon,  4 Apr 2016 16:46:50 -0600 (MDT)
Date: Mon, 04 Apr 2016 16:46:50 -0600
To: gpgmetestuser@encryptomail.xyz
Subject: THIS IS THE SUBJECT LINE
User-Agent: mail v14.8.8
Message-Id: <20160404224650.A27401606A4@mail.encryptomail.xyz>
From: pi@encryptomail.xyz

THIS IS THE BODY OF THE EMAIL MESSAGE.
This text should become encrypted" + "\n."

rawEmail_Armored = "Return-Path: <pi@encryptomail.xyz>
X-Original-To: gpgmetestuser@encryptomail.xyz
Delivered-To: gpgmetestuser@encryptomail.xyz
Received: by mail.encryptomail.xyz (Postfix, from userid 1001)
        id A27401606A4; Mon,  4 Apr 2016 16:46:50 -0600 (MDT)
Date: Mon, 04 Apr 2016 16:46:50 -0600
To: gpgmetestuser@encryptomail.xyz
Subject: THIS IS THE SUBJECT LINE
User-Agent: mail v14.8.8
Message-Id: <20160404224650.A27401606A4@mail.encryptomail.xyz>
From: pi@encryptomail.xyz

-----BEGIN PGP MESSAGE-----
Version: GnuPG v1

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
=fMjx
-----END PGP MESSAGE-----\n."

##TESTS
#encryptedMessage = EmailApp::EncryptomailUnitTests.testEncryptMailString(message, email)
#puts encryptedMessage
#size = EmailApp::EncryptomailUnitTests.testEmailSize(message)
#puts size
#decryptedMessage = EmailApp::EncryptomailUnitTests.testDecryptMailString(encryptedMessage, passphrase)
#puts decryptedMessage
#puts EmailApp::EncryptomailUnitTests.testkeydeletion(email)

##Message Generators
#puts rawEmail_NoArmor
#encryptedMessage = EmailApp::EncryptomailUnitTests.testEncryptMailString(message, email)
#puts encryptedMessage
decryptedMessage = EmailApp::EncryptomailUnitTests.testDecryptMailString(rawEmail_Armored, passphrase)
puts decryptedMessage
end