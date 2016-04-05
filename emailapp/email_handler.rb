#Email handling code
#code is commented out until it gets converted from pseudocode to Ruby

=begin

module EmailApp

    class Email_handler
    
        #Pseudocode method for email handling
        def self.email_handler ( rawEmail )
            #The rawEmail parameter is the entire email, formatted as a string.
            #Includes headers, subject, body, etc.
            groupEmailAddress = Parse group email recipient from text
            plaintextEmail = decrypt(rawEmail)
            #the decrypt method ALSO filters out everything not in ASCII armor - yay!
            sendLoop(plaintextEmail, groupEmailAddress)
            
        end
        
        
        def self.sendLoop(plaintextEmail, groupEmailAddress)
            groupMemberList = Find members of groupEmailAddress
            foreach member in groupMemberList
                #encrypt email for the individual member
                encryptedEmail = encrypt(plaintextEmail, member)
                #send email to the group member
                send(encryptedEmail, member)
            end
        end
        
    end

end

=end