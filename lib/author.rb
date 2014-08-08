class Author

  attr_accessor :id, :name

  def initialize(author_info)
    @id = author_info[:id]
    @name = author_info[:name]
  end

  def save
    result = DB.exec("INSERT INTO authors (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def self.all
    results = DB.exec("SELECT * FROM authors;")
    authors = []
    results.each do |result|
      authors << Author.new({:name => result['name'], :id => result['id']})
    end
    authors
  end

  def ==(another_author)
    self.name == another_author.name
  end
end
