require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'

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
      puts "#{index}) [#{person.class}] ID: #{person.id} Name: #{person.name} - Age: #{person.age}"
    end
  end

  def create_person
    flag = true
    while flag
      puts 'Do you want to create a student (1) or a teacher (2)? [Input a number]:'
      choice = gets.chomp.to_i
      case choice
      when 1
        create_student
        flag = false
      when 2
        create_teacher
        flag = false
      else
        puts 'Invalid input. Please try again.'
      end
    end
  end

  def create_student
    puts 'Age: '
    age = gets.chomp.to_i
    puts 'Name: '
    name = gets.chomp.capitalize
    puts 'Has parent permission? (y/n): '
    parent_permission = gets.chomp.downcase == 'y'
    student = Student.new(age, name, parent_permission: parent_permission)
    @people << student unless @people.include?(student)
    puts 'Student created successfully.'
  end

  def create_teacher
    puts 'Age: '
    age = gets.chomp.to_i
    puts 'Name: '
    name = gets.chomp.capitalize
    puts 'specialization: '
    specialization = gets.chomp.capitalize
    teacher = Teacher.new(age, specialization, name)
    @people << teacher unless @people.include?(teacher)
    puts 'Teacher created successfully.'
  end

  def create_book
    print 'Enter the title of the book: '
    title = gets.chomp.capitalize
    print 'Enter the author of the book: '
    author = gets.chomp.capitalize
    book = Book.new(title, author)
    @books << book unless @books.include?(book)
    puts 'Book created successfully.'
  end

  def create_rental
    puts 'Select a book from the following list by number:'
    list_all_books
    print 'Enter the number of the book: '
    book_index = gets.chomp.to_i - 1
    puts 'Select a person from the following list by number: (not id)'
    list_all_people
    print 'Enter the number of the person: '
    person_index = gets.chomp.to_i - 1
    puts('Select a date for the rental (YYYY-MM-DD): ')
    date = gets.chomp
    rental = Rental.new(date, @books[book_index], @people[person_index])
    @rentals << rental unless @rentals.include?(rental)
    puts 'Rental created successfully.'
  end

  def list_all_rentals_for_a_given_person_id
    puts 'Select a person from the following list by number: (not id)'
    @people.each_with_index do |person, index|
      puts "[#{index + 1}] ID: #{person.id} Name: #{person.name} - Age: #{person.age}"
    end
    print 'Enter the number of the person: '
    person_index = gets.chomp.to_i - 1
    puts 'Rentals for the person:'
    @rentals.each do |rental|
      if rental.person == @people[person_index]
        puts "Date: #{rental.date} - Book: #{rental.book.title} - Person: #{rental.person.name}"
      end
    end
  end
end
