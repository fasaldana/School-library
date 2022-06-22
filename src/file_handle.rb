require 'json'

class FileHandle
  def create_file (books)
    p books
    File.open("book.json", "w") do |f|
      f.write(JSON.pretty_generate(books))
    end
  end

  def read_file
    file = File.open('book.json', 'r')
    data = JSON.load file
    file.close
  end
end
