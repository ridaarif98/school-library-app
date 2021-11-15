require './person'
require './student'
require './teacher'

class HandlePerson
  def initialize(arg)
    @persons = arg
  end

  def create_teacher
    name, age = name_and_age
    print 'Specialization: '
    specialization = gets.chomp
    @persons.push(Teacher.new(age: age, specialization: specialization, name: name))
    puts('Person added successfully!')
  end

  def create_student
    name, age = name_and_age
    print 'Has parents permission? [Y/N]:  '
    parent_permission = gets.chomp != 'n'
    @persons.push(Student.new(age: age, classroom: 'Coding Class', name: name, parent_permission: parent_permission))
    puts('Person added successfully!')
  end

  def handle_person
    print 'Do you want to create a student(1) or a teacher(2)? [Input the number]: '
    choice = gets.chomp.to_i
    case choice
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def display_person
    puts 'All persons are: '
    @persons.each do |person|
      puts "[#{person.class.name.split('::').last}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age},"
    end
  end

  def name_and_age
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp

    [name, age]
  end

  private(:create_student, :create_teacher, :name_and_age)
end
