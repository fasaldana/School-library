require_relative './src/app'

@app = App.new
def user_choice # rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength
  flag = true
  puts 'Welcome to School Library App!'
  while flag
    puts 'Please select an option by entering a number:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given person id'
    puts '7. Exit'
    choice = gets.chomp.to_i
    flag = false if choice == 7

    case choice
    when 1
      @app.list_all_books
    when 2
      @app.list_all_people
    when 3
      input_person
    when 4
      book_input
    when 5
      rental_input
    when 6
      list_all_rentals_input
    when 7
      @app.save_info
      puts 'Thank you for using School Library App!'
    else
      puts 'Invalid option, please try again!'
    end
  end
end

def input_person
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
  @app.create_person(1, age, name, nil, parent_permission: parent_permission)
  puts 'Student created successfully.'
end

def create_teacher
  puts 'Age: '
  age = gets.chomp.to_i
  puts 'Name: '
  name = gets.chomp.capitalize
  puts 'specialization: '
  specialization = gets.chomp.capitalize
  @app.create_person(2, age, name, specialization)
  puts 'Teacher created successfully.'
end

def book_input
  print 'Enter the title of the book: '
  title = gets.chomp.capitalize
  print 'Enter the author of the book: '
  author = gets.chomp.capitalize
  @app.create_book(title, author)
  puts 'Book created successfully.'
end

def rental_input
  puts 'Select a book from the following list by number:'
  @app.list_all_books
  print 'Enter the number of the book: '
  book_index = gets.chomp.to_i - 1
  puts 'Select a person from the following list by number: (not id)'
  @app.list_all_people
  print 'Enter the number of the person: '
  person_index = gets.chomp.to_i - 1
  puts('Select a date for the rental (YYYY-MM-DD): ')
  date = gets.chomp
  @app.create_rental(book_index, person_index, date)
  puts 'Rental created successfully.'
end

def list_all_rentals_input
  puts 'Select a person from the following list by number: (not id)'
  @app.list_all_people
  print 'Enter the number of the person: '
  person_index = gets.chomp.to_i - 1
  puts 'Rentals for the person:'
  @app.list_all_rentals_for_a_given_person_id(person_index)
end

def main
  @app.load_data
  user_choice
end

main
