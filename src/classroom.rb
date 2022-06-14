class Classroom
  attr_accessor :label

  def initialize(label)
    @label = label
  end

  has_many :students
end
