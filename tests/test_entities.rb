require_relative '../src/book'
require_relative '../src/person'
require_relative '../src/student'
require_relative '../src/teacher'
require_relative '../src/rental'
require_relative '../src/classroom'
require_relative '../src/decorator'

RSpec.describe Book do
  it 'should be a book' do
    book = Book.new('Ruby', 'John')
    expect(book.class).to eq(Book)
  end
  it 'should have a title' do
    book = Book.new('Ruby', 'John')
    expect(book.title).to eq('Ruby')
  end
  it 'should have an author' do
    book = Book.new('Ruby', 'John')
    expect(book.author).to eq('John')
  end
end

RSpec.describe Person do
  it 'should be a person' do
    person = Person.new(20, 'John')
    expect(person.class).to eq(Person)
  end
  it 'should have a name' do
    person = Person.new(20, 'John')
    expect(person.name).to eq('John')
  end
  it 'should have an age' do
    person = Person.new(20, 'John')
    expect(person.age).to eq(20)
  end
  it 'should have a parent permission' do
    person = Person.new(20, 'John')
    expect(person.parent_permission).to eq(true)
  end
end

RSpec.describe Student do
  it 'should be a person' do
    student = Student.new(20, 'John', parent_permission: true)
    expect(student.class).to eq(Student)
  end
  it 'should have a name' do
    student = Student.new(20, 'Fernando', parent_permission: true)
    expect(student.name).to eq('Fernando')
  end
  it 'should have an age' do
    student = Student.new(20, 'John', parent_permission: true)
    expect(student.age).to eq(20)
  end
end

RSpec.describe Teacher do
  it 'should be a person' do
    teacher = Teacher.new(20, 'Ruby', 'John')
    expect(teacher.class).to eq(Teacher)
  end
  it 'should have a name' do
    teacher = Teacher.new(20, 'Ruby', 'John')
    expect(teacher.name).to eq('John')
  end
  it 'should have an age' do
    teacher = Teacher.new(20, 'Ruby', 'John')
    expect(teacher.age).to eq(20)
  end
  it 'should have a specialization' do
    teacher = Teacher.new(20, 'Ruby', 'John')
    expect(teacher.specialization).to eq('Ruby')
  end
end

RSpec.describe Rental do
  it 'should be a rental' do
    rental = Rental.new('2020-01-01', Book.new('Ruby', 'John'), Person.new(20, 'John'))
    expect(rental.class).to eq(Rental)
  end
  it 'should have a date' do
    rental = Rental.new('2020-01-01', Book.new('Ruby', 'John'), Person.new(20, 'John'))
    expect(rental.date).to eq('2020-01-01')
  end
end

RSpec.describe Decorator do
  it 'should have nameable' do
    nameable = Decorator.new(Person.new(20, 'John'))
    expect(nameable.class).to eq(Decorator)
  end

  it 'should have correct name' do
    correct_name = Decorator.new(Person.new('John', 'John'))
    expect(correct_name.class).to eq(Decorator)
  end
end

RSpec.describe CapitalizedDecorator do
  it 'should start with a capital letter' do
    book = CapitalizedDecorator.new(Book.new('Gifted', 'Ben'))
    expect(book.class).to eq(CapitalizedDecorator)
  end
end

RSpec.describe TrimmerDecorator do
  it 'should trim the length' do
    trimmer = TrimmerDecorator.new(Student.new(20, 'Johnmarystewart', parent_permission: true))
    expect(trimmer.correct_name).to eq('Johnmaryst')
  end
end