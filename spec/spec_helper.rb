require 'rspec'
require 'pg'
require 'book'
require 'pry'
require 'author'
# require 'patron'
require 'copy'


DB = PG.connect({:dbname => 'library_test'})

RSpec.configure do |config|
  config.before(:each) do
    DB.exec("DELETE FROM authors *;")
    DB.exec("DELETE FROM books *;")
    DB.exec("DELETE FROM authors_books *;")
    DB.exec("DELETE FROM copies *;")
    DB.exec("DELETE FROM patrons *;")
    DB.exec("DELETE FROM checkouts *;")
  end
end
