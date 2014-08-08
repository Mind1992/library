require 'spec_helper'

describe 'Book' do
  it 'initializes books with a title' do
    book = Book.new({:name => 'Moby Dick'})
    expect(book).to be_a Book
  end

  it 'adds the book to the database' do
    book = Book.new({:name => 'Moby Dick'})
    book.save
    expect(Book.all).to eq [book]
  end

  it 'returns all books' do
    book = Book.new({:name => 'Moby Dick'})
    book2 = Book.new({:name => 'Cat in the Hat'})
    book.save
    book2.save
    expect(Book.all).to eq [book,book2]
  end

  it 'recognizes when the same books are equal' do
    book = Book.new({:name => 'Moby Dick'})
    book2 = Book.new({:name => 'Moby Dick'})
    book.save
    book2.save
    expect(book.==(book2)).to eq true
  end

  it 'lets you seach for a book by name' do
    book = Book.new({:name => 'Moby Dick'})
    book.save
    expect(Book.search_by_name(book.name)).to eq book.id
  end

  it 'lets you update books' do
    book = Book.new({:name => 'Moby Dick'})
    book.save
    expect(book.edit("Moby Dick","Moby Sick")).to eq "Moby Sick"
  end

  it 'lets you delete books' do
    book = Book.new({:name => 'Moby Dick'})
    book.save
    book.delete("Moby Dick")
    expect(Book.all).to eq []
  end
end
