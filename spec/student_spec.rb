require_relative '../student'
require_relative '../classroom'
require_relative '../person'

describe Student do
  before(:each) do
    @classroom = Classroom.new('Chemistry')
    @stu = Student.new(age: 19, classroom: @classroom.label, name: 'Ali', parent_permission: false)
  end

  it ' show instance of student class' do
    expect(@stu).to be_instance_of Student
  end

  it 'show inheritance from person class' do
    expect(@stu).to be_kind_of Person
  end

  it 'check play_hooky not to be correct' do
    expect(@stu.play_hooky).not_to match '/()/'
  end

  it 'match classroom value' do
    expect(@stu.classroom).to eql @classroom.label
  end
end
