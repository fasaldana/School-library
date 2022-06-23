require 'json'

class FileHandle
  def create_book(book)
    File.write('book.json', JSON.pretty_generate(book))
  end

  def read_book
    if File.exist?('book.json')
      file = File.open './book.json'
      data = JSON.load file
      file.close
    end
    data
  end

  def create_person(person)
    File.write('person.json', JSON.pretty_generate(person))
  end

  def read_person
    if File.exist?('person.json')
      file = File.open './person.json'
      data = JSON.load file
      file.close
    end
    data
  end

  def create_rental(rental)
    File.write('rental.json', JSON.pretty_generate(rental))
  end

  def read_rental
    if File.exist?('rental.json')
      file = File.open './rental.json'
      data = JSON.load file
      file.close
    end
    data
  end
end
