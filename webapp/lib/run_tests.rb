# Test suite for Encryptomail backend functions
# 
# Test code and parameters are in backend_unit_tests.rb
#
# HOW TO RUN TESTS:
# In Bash terminal, navigate to webapp/lib
# Run this code with the command # irb ./run_tests.rb
# Tests rely on an OS with a GPG keychain - run them on Linux with GPG installed
# Set VERBOSE in backend_unit_tests.rb to 'true' to run verbose testing

load 'backend_unit_tests.rb'
require 'test/unit/assertions'
include Test::Unit::Assertions

class RunTests
	
	assert(BackendUnitTests::testGPGmekeygen(), "TEST 1 HAS FAILED")
	puts "OK - Test 1 passed"
	
	assert(BackendUnitTests::testpublickeyexport(), "TEST 2 HAS FAILED")
	puts "OK - Test 2 passed"
	
	assert(BackendUnitTests::testprivatekeyexport(), "TEST 3 HAS FAILED")
	puts "OK - Test 3 passed"
	
	assert(BackendUnitTests::testkeylisting(), "TEST 4 HAS FAILED")
	puts "OK - Test 4 passed"
	
	assert(BackendUnitTests::testEmailSize(), "TEST 5 HAS FAILED")
	puts "OK - Test 5 passed"
	
	assert(BackendUnitTests::testEncryptMailString(), "TEST 6 HAS FAILED")
	puts "OK - Test 6 passed"
	
	assert(BackendUnitTests::testDecryptMailString(), "TEST 7 HAS FAILED")
	puts "OK - Test 7 passed"
	
	assert(BackendUnitTests::testkeydeletion(), "TEST 8 HAS FAILED")
	puts "OK - Test 8 passed"
	
	# Backend::nuke()
	
	# ##Message Generators
	# puts rawEmail_NoArmor
	# encryptedMessage = EmailApp::Email_handlerUnitTests.testEncryptMailString(message, email)
	# puts encryptedMessage
	# decryptedMessage = EmailApp::Email_handlerUnitTests.testDecryptMailString(rawEmail_Armored, passphrase)
	# puts decryptedMessage
	
	# ##TESTS
	
	# ###TEST SET 1 - Key generation and listing
	# puts EmailApp::Email_handlerUnitTests.testGPGmekeygen(name, email, passphrase)
	# puts EmailApp::Email_handlerUnitTests.testGPGmeexportpublickey(email)
	# puts EmailApp::Email_handlerUnitTests.testprivatekeyexport(email)
	# puts EmailApp::Email_handlerUnitTests.testGPGmelistkeys()
	
	# ###TEST SET 2 - Message encryption and decryption
	# encryptedMessage = EmailApp::Email_handlerUnitTests.testEncryptMailString(message, )
	# puts encryptedMessage
	# size = EmailApp::Email_handlerUnitTests.testEmailSize(message)
	# puts size
	# decryptedMessage = EmailApp::Email_handlerUnitTests.testDecryptMailString(ross_encrypted_message, ross_passphrase)
	# puts decryptedMessage
	# puts EmailApp::Email_handlerUnitTests.testkeydeletion(email)
	
	# ###TEST SET 3 - Email_handler
	# EmailApp::Email_handler.email_handler(rawEmail_Armored)
	# decryptedMessage = EmailApp::Email_handlerUnitTests.testDecryptMailString(ross_test_message, ross_passphrase)
	# puts decryptedMessage
	
	
	# EmailApp::Email_handler.importkey(ross_prikey)
	# decryptedMessage = EmailApp::Email_handlerUnitTests.testDecryptMailString(ross_encrypted_message, ross_passphrase)
	# puts decryptedMessage
	
	# EmailApp::Email_handlerUnitTests.testimportdryrun
	
end