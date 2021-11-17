require_relative '../rental'
require_relative '../teacher'
require_relative '../student'
require_relative '../book'
require_relative '../classroom'

describe Rental do
  before(:each) do
    @book = Book.new(title: 'Fairy Tales', author: 'Rida')
    @classroom = Classroom.new('Chemistry')
    @stu = Student.new(age: 19, classroom: @classroom.label, name: 'Ali', parent_permission: false)
    @teacher = Teacher.new(age: 45, specialization: 'Maths', name: 'Mr Rajesh')
    @rental1 = Rental.new('2021/12/12', @stu, @book)
    @rental2 = Rental.new('2021/12/27', @teacher, @book)
  end

  it 'show instance of rental class' do
    expect(@rental1).to be_instance_of Rental
  end

  it 'verifies rental date for student' do
    expect(@rental1.date).to match '2021/12/12'
  end

  it 'verifies class of person(Student) who created a rental' do
    expect(@rental1.person).to be_instance_of Student
  end

  it 'verifies rental date for teacher' do
    expect(@rental2.date).not_to match '2011/12/12'
  end

  it 'verifies class of person(Teacher) who created a rental' do
    expect(@rental2.person).to be_instance_of Teacher
  end

  it 'expects students to be in rental array' do
    expect(@stu.rentals).to include @rental1
  end

  it 'expects teacher to be in rental array' do
    expect(@teacher.rentals).to include @rental2
  end

  it 'expects book to be in rental array' do
    expect(@book.rentals.size).to be 2
  end
end
