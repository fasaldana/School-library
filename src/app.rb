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
    if(file_handle.read_book)
      file_handle.read_book.each do |book|
        @books << Book.new(book['title'], book['author'])
      end
    end
    if(file_handle.read_person)
      file_handle.read_person.each do |person|
        if person['type'] == 'student'
          @people << Student.new(person['age'], person['name'], parent_permission: person['parent_permission'])
        else
          @people << Teacher.new(person['age'], person['name'], person['specialization'])
        end
      end
    end
    if(file_handle.read_rental)
      file_handle.read_rental.each do |rental|
        @rentals << Rental.new(rental['date'],  rental['book'], rental['person'])
      end
    end
  end

  def save_info
    book = []
    person = []
    rental = []
    file_handle = FileHandle.new
    @books.each_with_index do |book, index|
      obj = {id: index, title: book.title, author: book.author}
      books.push(obj)
    end
    @people.each_with_index do |person1, index|
      if(person1.class == Student)
        person.append({id: index + 1, type: 'student', age: person1.age, name: person1.name, parent_permission: person1.parent_permission})
      else
        person.append({id: index + 1, type: 'teacher', age: person1.age, name: person1.name, specialization: person1.specialization})
      end
    end
    @rentals.each_with_index do |rental1, index|
      rental.append({id: index + 1, date: rental1.date, book: rental1.book.title, person: rental1.person.name})
    end
    file_handle.create_book(book)
    file_handle.create_person(person)
    file_handle.create_rental(rental)
  end
end
