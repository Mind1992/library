class Copy

  attr_accessor :book_id, :amount

  def initialize(copy_info)
    @book_id = copy_info[:book_id]
    @amount = copy_info[:amount]
  end
end
