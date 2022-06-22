require 'json'

class FileHandle
  def create_file (book)
    p book
    File.open("book.json", "w") do |f|
        f.write(book.to_json)
    end
  end

  def read_file
    file = File.open "./book.json"
    data = JSON.load file
    file.close
  end
end
