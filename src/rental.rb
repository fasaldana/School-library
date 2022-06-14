class Rental
  attr_accessor :date

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  belongs_to :book
  belongs_to :person
end
