require './person'
require './decorator'
person = Person.new(22, 'maximilianus')
puts person.correct_name
capitalized_person = CapitalizedDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalizedPerson)
puts capitalized_trimmed_person.correct_name
