require './student.rb'
require './classroom.rb'
require './person.rb'
require './corrector.rb'
require './teacher.rb'

class_1 = Classroom.new("FiveClass")

student = Student.new( '1-a',17, 'bartholomew', false)
student_2 = Student.new( '1-a',18, 'bartholom', false)
# student.classroom = class_1

class_1.add_student(student)
student.classroom = class_1
class_1.add_student(student_2)
# puts(class_1.students.first)
# puts(student.classroom)
puts(class_1.students.map{|student| student.classroom})