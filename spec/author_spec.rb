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
end
