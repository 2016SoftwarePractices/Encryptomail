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
	
	assert(BackendUnitTests::testgeneratePGPkey(), "TEST 1 HAS FAILED")
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
	
	# Uncomment the line below to delete all the keys in your local keychain
	#Backend::nuke()
	
end