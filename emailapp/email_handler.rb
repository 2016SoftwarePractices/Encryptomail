#Email handling code
#code is commented out until it gets converted from pseudocode to Ruby

#require "../webapp/config/environment"
#load 'encryptomail.rb'

module EmailApp
    
    class Email_handler
        
        ##Method takes email in as raw string, with headers and ASCII armor
        def self.email_handler (rawEmail)
            passphrase = "hry785jB"
            matches = rawEmail.match(/^To: .*/)
            #puts matches[0]
            groupEmailAddress = matches[0].split(" ")
            puts groupEmailAddress[1]
            decryptedMessage = EmailApp::Encryptomail.decryptMailString(rawEmail, passphrase)
            puts decryptedMessage
            sendLoop(decryptedMessage, groupEmailAddress)
        end
        
        
        
        def self.sendLoop(plaintextEmail, groupEmailAddress)
            #groupMemberList = Find members of groupEmailAddress
            groupObject = EmailApp::Encryptomail.group_lookup(groupEmailAddress)
            groupObject.users.each do |user|
                userSpecificEncryptedEmail = EmailApp::Encryptomail.encryptMailString(plaintextEmail, user)
                #Send to postfix somehow
                #send(userSpecificEncryptedEmail, user)
            end
        end
        
        
        
        def self.send(encryptedEmail, userEmail)
            #Do stuff - send to postfix somehow
        end
    
    end
    
end







=begin

#input = $stdin.read
#puts input

module EmailApp

    class Email_handler
    
        #Pseudocode method for email handling
        def self.email_handler ( rawEmail )
            #The rawEmail parameter is the entire email, formatted as a string.
            #Includes headers, subject, body, etc.
            Parse WHO the recipient is
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