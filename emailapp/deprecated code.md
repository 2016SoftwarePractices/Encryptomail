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

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
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
