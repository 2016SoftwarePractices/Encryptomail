#pull in our entire rails app
require "../webapp/config/environment"
#pull in testing framework
#runs all functions in all classes defined in this file
#if those functions start with 'test_'
require "minitest/autorun"

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

class Tests4 < MiniTest::Test
		
	def setup
		@x = 4
	end	
	
	def test_thing
		assert_equal(@x, 4)
	end
	
end
