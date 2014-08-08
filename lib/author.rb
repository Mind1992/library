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

  def self.search_by_name(searched_name)
    Author.all.each.detect {|author| author.name == searched_name}.id.to_i
  end

  def edit(old_name, new_name)
    author_id = Author.search_by_name(old_name)
    result = DB.exec("UPDATE authors SET name = '#{new_name}' WHERE id = #{author_id} RETURNING name;")
    result.first['name']
  end

  def delete(author_name)
    author_id = Author.search_by_name(author_name)
    result = DB.exec("DELETE FROM authors WHERE id= #{author_id}")
    Author.all
  end
end
