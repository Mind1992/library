class Book

  attr_accessor :id, :name

  def initialize(book_info)
    @id = book_info[:id]
    @name = book_info[:name]
  end

  def save
    result = DB.exec("INSERT INTO books (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def self.all
    results = DB.exec("SELECT * FROM books;")
    books = []
    results.each do |result|
      books << Book.new({:name => result['name'], :id => result['id']})
    end
    books
  end

  def ==(another_book)
    self.name == another_book.name
  end

  def self.search_by_name(searched_name)
    Book.all.each.detect {|book| book.name == searched_name}.id.to_i
  end

  def edit(old_name, new_name)
    book_id = Book.search_by_name(old_name)
    result = DB.exec("UPDATE books SET name = '#{new_name}' WHERE id = #{book_id} RETURNING name;")
    result.first['name']
  end

  def delete(book_name)
    book_id = Book.search_by_name(book_name)
    result = DB.exec("DELETE FROM books WHERE id= #{book_id}")
    Book.all
  end
end
