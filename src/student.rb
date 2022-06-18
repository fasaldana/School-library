require_relative './person'

class Student < Person
  def initialize(age, name = 'unknown', parent_permission: true, classroom: nil)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
