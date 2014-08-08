require './lib/author'
require './lib/book'
require 'pg'

def main_menu
  loop do
    puts "*** LiBrArY"
    print "1: add book"; input = gets.chomp
    print "2: update book"; input = gets.chomp
    print "3: delete book"; input = gets.chomp
    print "4: list books"; input = gets.chomp
    print "5: add author"; input = gets.chomp
    print "6: update author"; input = gets.chomp
    print "7: delete author"; input = gets.chomp
    print "8: list authors"; input = gets.chomp
    case input
      when "1" then add_book
      when "2" then update_book
      when "3" then delete_book
      when "4" then list_books
      when "5" then add_author
      when "6" then update_author
      when "7" then delete_author
      when "8" then list_authors
  end
end

def add_book
  print "Name of the book: "; book_title = gets.chomp
  print "Author of the book: "; author_name = gets.chomp
  new_book = Book.new({:name => '#{book_title}'})
  new_book.save
  new_author = Author.new({:name => '#{author_name}'})
  new_author.save

end

main_menu
