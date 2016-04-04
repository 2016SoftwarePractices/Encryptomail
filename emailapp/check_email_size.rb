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



