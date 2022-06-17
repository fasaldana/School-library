require_relative './src/app'

def user_choice # rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength
  app = App.new
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
      app.list_all_books
    when 2
      app.list_all_people
    when 3
      app.create_person
    when 4
      app.create_book
    when 5
      app.create_rental
    when 6
      app.list_all_rentals_for_a_given_person_id
    when 7
      puts 'Thank you for using School Library App!'
    else
      puts 'Invalid option, please try again!'
    end
  end
end

def main
  user_choice
end

main
