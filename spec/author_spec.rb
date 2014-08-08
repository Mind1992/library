require 'spec_helper'

describe 'Author' do
  it 'initializes with an authors name' do
    author = Author.new({:name => 'Herman Melville'})
    expect(author).to be_a Author
  end

  it 'adds the author to the database' do
    author = Author.new({:name => 'Herman Melville'})
    author.save
    expect(Author.all).to eq [author]
  end

  it 'returns all authors' do
    author = Author.new({:name => 'Herman Melville'})
    author2 = Author.new({:name => 'Dr. Suess'})
    author.save
    author2.save
    expect(Author.all).to eq [author,author2]
  end

  it 'recognizes when the same authors are equal' do
    author = Author.new({:name => 'Herman Melville'})
    author2 = Author.new({:name => 'Herman Melville'})
    author.save
    author2.save
    expect(author.==(author2)).to eq true
  end

  it 'lets you seach for an author by name' do
    author = Author.new({:name => 'Herman Melville'})
    author.save
    expect(Author.search_by_name(author.name)).to eq author.id
  end

  it 'lets you update Authors' do
    author = Author.new({:name => 'Herman Melville'})
    author.save
    expect(author.edit("Herman Melville","Hermit Crab")).to eq "Hermit Crab"
  end

  it 'lets you delete Authors' do
    author = Author.new({:name => 'Herman Melville'})
    author.save
    author.delete("Herman Melville")
    expect(Author.all).to eq []
  end

  it 'lets you search for a book by author' do
    author = Author.new({:name => 'Herman Melville'})
    author.save
    book = Book.new({:name => 'Moby Dick'})
    book.save
    expect(Author.serch_for_book('Moby Dick')).to eq book.name
  end
end
