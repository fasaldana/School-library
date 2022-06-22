require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require_relative './file_handle'

class App
  def initialize(books = [], people = [], rentals = [])
    @books = books
    @people = people
    @rentals = rentals
  end

  def list_all_books
    @books.each_with_index do |books1, index|
      puts "#{index + 1}) title: #{books1.title} - author: #{books1.author}"
    end
  end

  def list_all_people
    @people.each_with_index do |person, index|
      puts "#{index + 1}) [#{person.class}] ID: #{person.id} Name: #{person.name} - Age: #{person.age}"
    end
  end

  def create_person(choice, age, name, specialization, parent_permission: true)
    if choice == 1
      student = Student.new(age, name, parent_permission: parent_permission)
      @people << student unless @people.include?(student)
    else
      teacher = Teacher.new(age, name, specialization)
      @people << teacher unless @people.include?(teacher)
    end
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book unless @books.include?(book)
  end

  def create_rental(book_index, person_index, date)
    rental = Rental.new(date, @books[book_index], @people[person_index])
    @rentals << rental unless @rentals.include?(rental)
  end

  def list_all_rentals_for_a_given_person_id(person_index)
    @rentals.each do |rental|
      if rental.person == @people[person_index]
        puts "Date: #{rental.date} - Book: #{rental.book.title} - Person: #{rental.person.name}"
      end
    end
  end

  def load_data
    file_handle = FileHandle.new
    if(file_handle.read_file)
      @books = file_handle.read_file
    end
  end

  def save_info
    book = []
    file_handle = FileHandle.new
    @books.each_with_index do |books1, index|
      book.append({id: index + 1, title: books1.title, author: books1.author})
    end
    file_handle.create_file(book)
  end
end
