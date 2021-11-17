require_relative '../classroom'
require_relative  '../student'

describe Classroom do
    before(:each) do 
        @classroom = Classroom.new('Chemistry')
        @stu  = Student.new( age: 19, classroom: @classroom.label, name: 'Ali', parent_permission: false ) 
    end

    it " show instance of classroom class" do
        expect(@classroom).to be_instance_of Classroom
    end

    it "add student details to student array" do
        @classroom.add_student(@stu)
        expect(@classroom.students).to include @stu
    end

    it "check student classroom match with class label" do
        expect(@classroom.label).to eql @stu.classroom
    end
end