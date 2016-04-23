require 'rubygems'
require 'gpgme'
load 'email_handler.rb'
#require "../webapp/config/environment"

module EmailApp

	class Email_handlerUnitTests

                #test PGP keypair generation
                def self.testGPGmekeygen(name, email, passphrase)
                        puts "TEST: Attempting to test the creation of a key using GPGme"
                        puts "(GPGme) Trying to generate PGP key - this may take a while: "
                        key_string = EmailApp::Email_handler.generatePGPkeyGPGme(name, email, passphrase)
                        puts key_string
                        puts "GPGme has successfully created a new keypair for #{email}"
                end
    		
    		
    		  #test public key export
    		def self.testGPGmeexportpublickey(email)
                        puts "TEST: Attempting to export public key for #{email}"
                        EmailApp::Email_handler.exportpublickeyGPGme(email)
    		end
    		
    		
            #test private key export
    		def self.testprivatekeyexport(email)
                        puts "TEST: Attempting to export private key for gpgmetestuser@test.com"
                        EmailApp::Email_handler.exportprivatekey(email)
    		end
    		
    		
                #test key listing
                def self.testGPGmelistkeys()
                        EmailApp::Email_handler.listallpublickeys()
                        EmailApp::Email_handler.listallprivatekeys()
                end
    		
    		
    		def self.testkeydeletion(email)
                        EmailApp::Email_handler.deleteuserkeys(email)
    		end
    		
    		
    		#test encrypting simple message
    		def self.testEncryptMailString(message, email)
                        puts "TEST: Attempting to test encrypting a message using GPGme"
                        encrypted = EmailApp::Email_handler.encryptMailString(message, email)
                        puts "GPGme has successfully encrypted a message for #{email}"
                        return encrypted
    		end
    		
    		
    		#test decrypting simple message
    		def self.testDecryptMailString(messageToDecrypt, passphrase)
                        puts "TEST: Attempting to test decrypting a message using GPGme"
                        decrypted = EmailApp::Email_handler.decryptMailString(messageToDecrypt, passphrase)
                        puts "GPGme has successfully decrypted the message"
                        return decrypted
    		end
    		
    		#Test email size function
    		def self.testEmailSize(email)
                        puts "TEST: Verifying email size"
                        size = EmailApp::Email_handler.check_email_size(email)
                        return size
    		end

	end

##******* Main() ********
##TEST SET 1 PARAMS
name = "gpgmetestuser"
email = "gpgmetestuser@encryptomail.xyz"
passphrase = "hry785jB"

##TEST SET 2 PARAMS

message = "Ned: Are you now or have you ever been a Norse God,
Vampire, or Time Traveling Cyborg?
Mike O' Donnell: I've known you since what, first grade?
I think that maybe I would have told you!
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

test_pubkey = "-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: Mailvelope v1.3.6
Comment: https://www.mailvelope.com

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
m68cEw7yVTZI
=Abbh
-----END PGP PUBLIC KEY BLOCK-----"

##Message Generators
#puts rawEmail_NoArmor
#encryptedMessage = EmailApp::Email_handlerUnitTests.testEncryptMailString(message, email)
#puts encryptedMessage
#decryptedMessage = EmailApp::Email_handlerUnitTests.testDecryptMailString(rawEmail_Armored, passphrase)
#puts decryptedMessage

##TESTS

###TEST SET 1 - Key generation and listing
#puts EmailApp::Email_handlerUnitTests.testGPGmekeygen(name, email, passphrase)
#puts EmailApp::Email_handlerUnitTests.testGPGmeexportpublickey(email)
#puts EmailApp::Email_handlerUnitTests.testprivatekeyexport(email)
#puts EmailApp::Email_handlerUnitTests.testGPGmelistkeys()

###TEST SET 2 - Message encryption and decryption
#encryptedMessage = EmailApp::Email_handlerUnitTests.testEncryptMailString(message, )
#puts encryptedMessage
#size = EmailApp::Email_handlerUnitTests.testEmailSize(message)
#puts size
#decryptedMessage = EmailApp::Email_handlerUnitTests.testDecryptMailString(ross_encrypted_message, ross_passphrase)
#puts decryptedMessage
#puts EmailApp::Email_handlerUnitTests.testkeydeletion(email)

###TEST SET 3 - Email_handler
#EmailApp::Email_handler.email_handler(rawEmail_Armored)
#decryptedMessage = EmailApp::Email_handlerUnitTests.testDecryptMailString(ross_test_message, ross_passphrase)
#puts decryptedMessage


#EmailApp::Email_handler.importkey(ross_prikey)
#decryptedMessage = EmailApp::Email_handlerUnitTests.testDecryptMailString(ross_encrypted_message, ross_passphrase)
#puts decryptedMessage

EmailApp::Email_handlerUnitTests.testimportdryrun

end