require './person'

class Student < Person
  attr_reader :classroom
  def initialize( classroom, age, name = 'Unknown', parent_permission= DEFAULT_BOOL)
    super( age, name, parent_permission)
    @classroom = classroom
  end


  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

end