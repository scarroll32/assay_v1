#!/usr/bin/ruby
require 'rubygems'
require 'sqlite3'

begin
    
    db = SQLite3::Database.open "development.sqlite3"
    puts db.get_first_value 'SELECT COUNT(*) FROM COSMICS_66'
    
rescue SQLite3::Exception => e 
    
    puts "Exception occured"
    puts e
    
ensure
    db.close if db
end