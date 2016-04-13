= Deprecated Code from Encryptomail Project    		
    		
# def self.testOpenPGPkeygen()
#  		puts "TEST: Attempting to test the creation and export of a key using OpenPGP"
#  		puts "(OpenPGP) Trying to generate PGP key - this may take a while: "
#  		key_string = EmailApp::Encryptomail.generatePGPkeyOpenPGP('OpenPGPtestuser', 'OpenPGPtestuser@test.com', '12345QQqa')
#  		puts key_string
#  		puts "OpenPGP has successfully created a new keypair for OpenPGPtestuser"
# end

# def self.testOpenPGPexport()
# 	puts "Attempting to export public key for OpenPGPtestuser"
# 	gpg = OpenPGP::Engine::GnuPG.new(:homedir => '~/.gnupg')
# 	pub_key_string = gpg.export("OpenPGPtestuser") #This line uses deprecated methods, cannot be used
# 	print pub_key_string.to_s
# end

messageToDecrypt = "-----BEGIN PGP MESSAGE-----
Version: GnuPG v1

hQEMA4W7VnnHGGbXAQgAlANh5nx+XJv3sldJgWMEmacL0ZFM899pFBUjdt4Z4wmV
atetOHBfXRTWRpRnl3iuIHISIltmrICu1d6PbT0iBCDaLmKNGu3QUp7orqO0GNtp
CvXToz9iaMZIQ2uCvn1HFp7vLagQXZYGC/0fqgYYuhL65pVo+X2CNKnP8ns4MY78
8YBU6eDtmFE/ErEzXJBeAPd/TgIGABz4q8fRaLXRLZoN13+RcI3c0zCjJGkK8K0M
XFIsysyAE7hToiMF2ZO1exQYHyC/jY0yVuBchqFKvcHQ7lg+tqy4vXw9wpihzUko
oYvmUXwJAEka1YPs+3oeum4nsbhcMDk1ddoLzNjg2YUCDAMNzUpAjaY32AEQALmR
MHh5wbclm+kadRfTxNbEiPd8Bu/Or78hAgN4vbFzQTtH1+gsxICrZPgG8Nv1OtBZ
wNBV+PgheqLmVoLyAln3QJ6imqR4pgKI3hv4rvouwqWKCuW/KPjjG27SMniLBTo7
S8Q7h5ROvyIE7KcD8VFc4QuSvmoy02lnh8f0HyPLpHBJ4CSd7LPH3eC4TCJMgMAq
j76B/Yl7rFrjl6I7EC3r/sEWyP+lQpf0f1vNEsaN/sQHTajzRs0iBTwi3pm7YU54
wn+mWneLoJfXI8nGXrhn6FYb9qGtfDlEq/02w6uQDXfY7ncAgZKL37nxOcztHSvl
DxGV2ruK2jzFPQS3c/zqbilVwBXHKnTG1HvIUwUuHstitbGdbLX7/bIUVdHi3mOW
YFIT3RsTmbofXH/APRW3O3CN2wwVpGabjS1OvUv499u0bL668XdOmeqBnIYav0BE
nzMUBMTFUdAYKXrHJtVSIcx8QdSQtHcAK4VhzxJj9u16zW0zMRKuQ2b8qk8D/A5L
Txmc0rKmLtTSpk7BWfFoCqAaNOfgVPWofierso98nQUQoc/lN/uxcIvZKsh3UWmx
9dGlVcULbwzymEfLj7ufAhs2wmyAwRvXdrRP4nVcuqlyxm7fHZMIYwKwoLuWnM6w
8kPlpQ/2Cmzzn2DQkmhqebZyABtVQD6GPweOFqdBhQIMA5aRndzfCDAHAQ/+L6Nc
Z8LE8LlhBZr8Xf2wsv0GuaV3ebosfm67osRmWsXr/5UMS7AqmibqwyL+DjbNxMlr
XbFz35Ad3zcqQdGaK+x/pacp8rTijOlc9K3+x30ad9iY4hbPXqbiyrTJ4qA8rlRO
9m0uFIS+boZhKIWdtvI1fMHKSUEVtcobxw7amKelzNc+6DdmRnrzR0EJFzNl14KQ
USacbKkYSFXBu10L1cGZlVpHVxtYpH9Ahzz0bdvbLZdp6MjCi/cRqb+aZBk0dTN2
pa2Mv0U314H9gkahE05wsclUTdKLs40iXsQUX9ju6ISSLyOAmpd4z7ejdj7vYPRm
8ComPNHW0ha/r0LgxgeYQrRLe6Vyv5gx1wGB463AWvvbO2HNdqBpmK7cvLWs/4Dz
6mlBV/s/mocRPJfUfeo5Rg8Lt+5bw/DRB/wAzYcBaW0jxTzxeT+LXm3m3pZ4ykRD
ETasfUWuZ49qnSAuM8DsQMsLBkQH4ExdD/Kie7IbVFq7vFZQC/PTu/TXsQPliSqb
yKVrIihZNV67m8DMmteaCR3ReCmOezxRGxCXT3A08eFnsyrI41dwx1hTWuorpBlB
ohPf0V8QvkzDrigqP+4yvzW//zbnIjKWG6neM1jYmhNA1W06E+Cv1FsWp+s/q0oY
OIrXu14qJHmNMo7OeQ8LKvarBF1dCkWlubu4Z2HSwDgBarMcv/NX2C2yyuJadNKm
jv3VpM4+xJx4fJewsd07+bgNTWa3ry8OE5MAZeV6bXH3bKsnjtuwqj4Imrzxx63h
MNupU9WvUcGujr9RSGyMnCNsfO9k2XcdG8wIzXnavjv/tm8vMKH2MK/xbcosuSXZ
lYNfthR1v6hCbBzf/tHj80XVpWz7k39evN2FZhYo7RYT7tUtaMi5ROtc3W/1Oj/5
c6m8Ev9a1uuXyLlFfU0YDaYsO57JljDMrRRNo3ovHsok/jyjXQcm1I9DFMkFgpt0
tJ5u/VeA5XqKdXUspdAXACBczTWaSaCYbR18wbdW7dCx0xW61jgykQ==
=Sl+Y
-----END PGP MESSAGE-----"


# Tests.rb
#pull in our entire rails app
require "../webapp/config/environment"
#pull in testing framework
#runs all functions in all classes defined in this file
#if those functions start with 'test_'

#puts Group.all.count
#Group.all.each do |g|
#	puts g.inspect
#end


require "minitest/autorun"

require_relative "group_lookup"

#note:
#normally, run this file with 
#$> ruby tests.rb
#can be run with
#$> ruby tests.rb --seed 5555
#to force any randomness to start with the seed '5555'


#this class doesn't even have 'Test' in its name
#and functions from it will still be run
class WhatIsThisIDontEven < MiniTest::Test
	
	#this test asserts a thing that will always fail
	def test_should_fail
		assert_equal(1, 2)
	end
	
	#function doesn't start with 'test_', and won't be run
	def not_a_test
		assert_equal(1, 3)
	end
	
end

#here is another test class
class Tests3 < MiniTest::Test
	
	#this function gets run before
	#any test_function
	def setup
		@x = 3
	end	
	
	#test runs, and uses the '@x' variable defined in 'setup'
	def test_thing
		assert_equal(@x, 3)
	end
	
	#test runs, and uses the '@x' variable defined in 'setup'
	def test_second_thing
		assert_equal(9, @x * @x)
	end
	

end

class TestGroupLookup < MiniTest::Test
	include EmailApp
	def setup
		
	end	
	
	def test_group_lookup
		group = group_lookup('test_unlocked_group_1@encryptomail.xyz')
		assert_equal(false, group.nil?)
	end
	
end



module EmailApp

    class CheckEmailSize


        MEGABYTE = 1024.0 * 1024.0
        # method to convert bytes to megabytes
        def self.bytesToMeg bytes
          bytes /  MEGABYTE
        end
        
        # method to check the size of an email
        def self.check_email_size(email)
            email_size = File.size(email)
            bytesToMeg(email_size) #prints out size of email in Megabytes.
        end
        
        check_email_size('smtp_message.rb')
        
        # method that checks if the email is bigger than 25 Mb and reacts accordingly
        def self.email_size_validation(email)
            if check_email_size(email) > 25 
                #some sort of error message sent back to user.
            else
                puts "valid email size"
            end
        end
        
        #this test file (smtp_message.rb) is 2,193 bytes which should be 0.00020914077758789062 Megabytes
        email_size_validation('smtp_message.rb') #Valid Email size
        
        
        #--------- Testing the File.size method ---------
        #Check file size of smtp_message.rb
        #smtp_message_size = File.size('smtp_message.rb')
        
        #puts smtp_message_size.to_s + ' bytes'
        #puts bytesToMeg(smtp_message_size).to_s + ' Mb'
        
        
        #Check file size of encrypt_or_decrypt.rb
        #encrypt_or_decrypt_size = File.size('encrypt_or_decrypt.rb')
        
        #puts encrypt_or_decrypt_size.to_s + ' bytes'
        #puts bytesToMeg(encrypt_or_decrypt_size).to_s + ' Mb'
        
    end
end




# require 'rubygems'
# require 'gpgme'
load 'email_handler.rb'
require "../webapp/config/environment"

#Written by P. Ross Baldwin

module EmailApp

	class Encryptomail
		
	            #Method to generate a PGP keypair
	            #(String name, String email, String passphrase)
		def self.generatePGPkeyGPGme(name, email, passphrase)
		      puts "Attempting to create a PGP keypair via GPGme for #{name}, #{email}"
          		ctx = GPGME::Ctx.new()
          		      # Build the params block, and generate the keys
                  fields = buildparamsblock(name, email, passphrase)
          		      # If pubkey and seckey are both set to nil, it stores the generated key pair into your key ring.
          		ctx.generate_key(fields, nil, nil)
    		            # KEY IS NOT RETURNED, it is added to the Linux local keychain
		end
		
		
		
		      #Method to export a public key by email address
		def self.exportpublickeyGPGme(email)
    			puts "Attempting to export public key via GPGme for #{email}"
 			pub_key = GPGME::Key.find(:public, "#{email}")
 			      # pub_key IS AN ARRAY OF GPGME::DATA OBJECTS
 			data = pub_key.first.export(:armor => true)
        		data.to_s
        		      # KEY IS NOT RETURNED - it is added to the linux keychain only!
    		end
    		
    		
    		
    		      #Method to export a private key by email address
    		def self.exportprivatekey(email)
    		      puts "Attempting to export private key for #{email}"
    		      pri_key = `gpg --export-secret-key --armor "#{email}"`
    		      puts pri_key.to_s
    		end
    		
    		
    		
    		      #Method lists public keys to the Linux terminal
            def self.listallpublickeys()
                  puts "Attempting to list all public keys in the Linux keychain"
                  puts "***PUBLIC KEYS***"
                  pub_key_list = `gpg --list-keys`
                  puts pub_key_list.to_s
            end
    	      
    	      
    	      
    	            #Method lists private keys to the Linux terminal
            def self.listallprivatekeys()
                  puts "Attempting to list all private keys in the linux keychain"
                  puts "***PRIVATE KEYS***"
                  pri_key_list = `gpg --list-secret-keys`
                  puts pri_key_list.to_s
            end
            
            
            
                  #Method deletes both public and private keys for a user
                  #BUGGED - REQUIRES INPUT FROM THE CONSOLE
            def self.deleteuserkeys(email)
                  puts "Attempting to delete public and private keys for #{email}"
                  output = `gpg --delete-secret-key "#{email}"`
                  puts output.to_s
                  output = `gpg --delete-keys "#{email}"`
                  puts output.to_s
            end
    		
    		
    		
    		      #Checks the DB for the group containing a specific email address
            def self.group_lookup(email)
                  if (Group.where(email: email).exists?)
                        Group.find_by(email: email) 
                  else
                        nil
                  end
            end
            
                  #******************************************#
                  #**********Class Helper Function**********#
            def self.buildparamsblock(name, email, passphrase)
                  block = []
                  block << '<GnupgKeyParms format="internal">'
                  block << 'Key-Type: DSA'
                  block << 'Key-Length: 4096'
                  block << 'Subkey-Type: ELG-E'
                  block << 'Subkey-Length: 1024'
                  block << "Name-Real: #{name}"
                  block << 'Name-Comment: Includes passphrase'
                  block << "Name-Email: #{email}"
                  block << 'Expire-Date: 0'
                  block << "Passphrase: #{passphrase}"
                  block << '</GnupgKeyParms>'
                  
                  return block.join("\n")
            end
                  #******************************************#
                  #**********Class Helper Function**********#
            
            
            #*********************************************************
            #*********Encryption and Decryption methods***************
            
            def self.encryptMailString(message, email)
                  crypto = GPGME::Crypto.new :armor => true, :always_trust => true
                  encrypted = crypto.encrypt(message) 
                  return encrypted
            end
              
              
              
            def self.decryptMailString(message, passphrase)
                  crypto = GPGME::Crypto.new :armor => true, :always_trust => true
                  decrypted = crypto.decrypt(message, :password => passphrase)
                  return decrypted
            end
            
            
            #**************************************************
            #**************email size checker code*************
            # method to check the size of an email
            def self.check_email_size(message)
                  email_size = File.size(message)
                  bytesToMeg(email_size) #prints out size of email in Megabytes.
            end


            MEGABYTE = 1024.0 * 1024.0
            # method to convert bytes to megabytes
            def self.bytesToMeg bytes
                  bytes /  MEGABYTE
            end
            
	end
end




s = "(No subject)

Jon Cornwell
  Reply|

-----BEGIN PGP MESSAGE-----
Version: Mailvelope v1.3.4
Comment: https://www.mailvelope.com

wcFMAwMImTa+FQ7pAQ/+PWFzG2s8OpdlrUcsVUb9aB6hwaCazjtlLQlGT4gg
qsC4Nhlyg6efdI00pXgRqvX2uxCRZtoENbjTaogZmUm6o8+g+awytjWP1bVN
5jW/4LYAUB6jCOImbTsSdRlx0PtI2QH4i7f5DBXEwbFvm9gUf4fVfVuCJxRX
4YGkuGcSpY5vZBFiWa2UYZ5gg5oQB8YQRP8QSpd0QrnbU32Xdqes7o0N/y3k
lGmSd6ZjojsVL+VIF7djrkmpQ2cqmbT/Qxy5aYpNJTeY8Rcb0WGEoGu3g4bA
bKtIF4UxCrS+ktDQlClrmY01Stf9s+Rs1W/oUhaJj9iEphDlIoUBec5ljiC9
LEfIGEpS6oypKRNCWd+rlrRJp3THH0cKp2o3wlz/9uqo8RPc+64Bob1fefMP
pVhvC27UkeCFSDVP7gfFp4T+hO03J96WeHHnOoPvdg9DF9DEygjzcweCQUOc
SFi7sSFP/kVsH1jpwsKCvD7YtW8P8LO5D2AZQJavyi0S771sHnOjzDWZjZYC
3YogCMvmR43CIL5DQ6dn+7twwmjWLYexNbFQeXGu3H8FFfJOv++a2pWd3V/S
CdL98ONT5bjlIY9BRr1vrse1OFpIVzWj0PHd+1S5NegC87sWgrxF6HTn0qIP
VUgpqt1icx/qnHr24mUjG2hKn2cz6+deMcVvyypVkPjBwUwDDnmdRwW1B/kB
D/9LJ95/H1VE+/U0EffdmFhPCgyz967D5DsADiZyiil9Go3G4gfjaT9P2NX5
NGnbKnBWIfuQ8rEZdznogzpE00NRoEPXhFihYNsPU45P9yELzjBC2Oe5jmxt
0mSq8Snu/AVLNb4P1KdybRy8yoYgHxidfXO5yK43NyHgu7ClnUJohWPuh437
otTHn6CfQNdY77hjOm7QKHR1IaZb6Q8QDdSqtxXhaAad2kG/IWojP7TbAnt2
xstg6vT6xL1vM2NfmQxeupH0MnqA2uPqeoD8GpG3B9aSrG3fzO0nQka/PrZF
zx1XvpueNYtz4VCkJqKzFc9nk+trVDsfnqHRM3HsXMVNhSD1qKMnKgBF7M5s
BMujy4QBHzo7HkCI1YRGXssLuI/ZpV9f4p5mq43CO9sbZma/vOAH1lgYSRCn
SkigzZirvA8K1rPAjBzF6J9ACJntKYVCgQfduOQ3EprwteKG0KRPdp4jQv8S
COOm/Vp54PB1ABm4x9nVCeRCBOTBvlt6yeJaTK71c1m8OwPySB9qScugV/O5
oeVt+mw71Ut3k+IB9sckgWFg2viH/NvY4fN4Imcl8JQrStYAT+/0KCstlAfG
WcRz3MUga4nLgAhJ3kFA3T2XAt7y/+7jMiYpuE8De74N4q/T4wgmBQrjVMoU
qKeC1u1yW6LW6oad7JG7MjXYDtLAkwEAUjywCY7vMFxvxL3kBKo6KMxdUZJu
HoPQRkdGXcd6b8+SZ0Qc2sfhhIL6RsZc7ArimHc7gpeJrNFeA93vmm7uJE2D
o2f9eiB1kFWjCa1yV6l9fG615fKt/V/ZqlSZf2BBwdyjxTQRmkrbTVjNF7Dg
PfqNtf32mQlLxmDeRh+qBrHyMlauMBhmIh0JSGcxjhg9qbJ+p0+qF4PGUXWV
E3L8f3s+JDfwtHe3ReriOZGq1ag77XMMnrKKGKd7J+b0Y4qmrqYComA8SF4h
+NnTtpuy9E9xDf8mLewb9Fsla0NqxhC5MRScUHoFQ7P6v9hGV2tWNnr5qa81
Og9YTfLsI11yebB14lo+uz9dz0+rdzGV3xybvbs0b5r6UUU481tJLbWYJTI9
sMcPEGwSNaOs0dnh464Ep0wjrKDWSRAsJ7dqPGN9BrNTZ58UvrOITnIRQqgj
Ug==
=uW07
-----END PGP MESSAGE-----"

parsed = s.split('-----BEGIN PGP MESSAGE-----')[1].strip
puts parsed

file_size = size(smtp_message.rb)

puts file_size