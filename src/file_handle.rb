require 'json'

class FileHandle
  def create_book (book)
    File.open("book.json", "w") do |f|
      f.write(JSON.pretty_generate(books))
    end
  end

  def read_book
    if(File.exist?("book.json"))
      file = File.open "./book.json"
      data = JSON.load file
      file.close
    end
    return data
  end

  def create_person (person)
    File.open("person.json", "w") do |f|
        f.write(person.to_json)
    end
  end

  def read_person
    if(File.exist?("person.json"))
      file = File.open "./person.json"
      data = JSON.load file
      file.close
    end
    return data
  end

  def create_rental (rental)
    File.open("rental.json", "w") do |f|
        f.write(rental.to_json)
    end
  end

  def read_rental
    if(File.exist?("rental.json"))
      file = File.open "./rental.json"
      data = JSON.load file
      file.close
    end
    return data
  end
end
