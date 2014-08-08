require 'spec_helper'

describe 'Copy' do
  it 'initializes with a book ID and amount' do
    book = Book.new({:name => "Moby Dick"})
    copy = Copy.new({:book_id => book.id, :amount => 3})
  end
end
