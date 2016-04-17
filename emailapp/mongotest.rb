#jeff@jefflazerus.com
# This is a helper file to produce objects from the mongodb that the emailapp can use

require 'mongo'
require 'pp'

include Mongo

host = ENV["C9_HOSTNAME"]
port = '27017'

# @db = Mongo::Client.new('mongodb://jlazerus-encryptomail-2927415:27017/encryptomail_development')
# @collection = @db['users']

puts "Connecting to #{host}:#{port}"

# TODO: replace hard-coded URI with variables pointing to the host (doesn't work on C9)
db = Mongo::Client.new("mongodb://jlazerus-encryptomail-2927415:27017/encryptomail_development")
# coll = db[:coll]
# coll.drop
# coll.create
# # Remove all records, if any
# coll.delete_many

# # Insert five records
# coll.insert_one('a' => 1)
# coll.insert_one('a' => 2)
# coll.insert_one('b' => 3)
# coll.insert_one('c' => 'foo')
# coll.insert_one('c' => 'bar')

# # Count.
# puts "There are #{coll.count} records."

# # Find all records. find() returns a Cursor.
# puts "Find all records:"
# pp cursor = coll.find.to_a

# # Print them. Note that all records have an _id automatically added by the
# # database. See pk.rb for an example of how to use a primary key factory to
# # generate your own values for _id.
# puts "Print each document individually:"
# pp cursor.each { |row| pp row }

# # See Collection#find. From now on in this file, we won't be printing the
# # records we find.
# puts "Find one record:"
# pp coll.find('a' => 1).to_a

# # Find records sort by 'a', skip 1, limit 2 records.
# # Sort can be single name, array, or hash.
# puts "Skip 1, limit 2, sort by 'a':"
# pp coll.find({}, {:skip => 1, :limit => 2, :sort => {'a' => 1}}).to_a

# # Find all records with 'a' > 1. There is also $lt, $gte, and $lte.
# coll.find({'a' => {'$gt' => 1}})
# coll.find({'a' => {'$gt' => 1, '$lte' => 3}})

# # Find all records with 'a' in a set of values.
# puts "Find all records where a is $in [1, 2]:"
# pp coll.find('a' => {'$in' => [1,2]}).to_a

# puts "Find by regex:"
# pp coll.find({'c' => /f/}).to_a

# # Print query explanation
# puts "Print an explain:"
# pp coll.find({'c' => /f/}).explain

puts "----------------------------\n"

# user_list = db[:users]
# puts "Find all user records:"
# pp cursor = user_list.find.to_a

# group_list = db[:groups]
# puts "Find all group records:"
# pp cursor = group_list.find.to_a

nums = db[:groups].find.projection(:user_ids => 1)
# pp nums.find.to_a

# documents = db[:users].find()
nums.each { |num| pp num}
  #=> Yields a BSON::Document.
