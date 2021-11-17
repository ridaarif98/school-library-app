require_relative '../teacher'

describe Teacher do
  before(:each) do
    @teacher  = Teacher.new( age: 45, specialization: 'Maths', name: 'Mr Rajesh')
 end

  it " shows instance of teacher class" do
    expect(@teacher).to be_instance_of Teacher
  end

  it "shows inheritance from person class" do
    expect(@teacher).to be_kind_of Person
  end

  it "confirms age of teacher to be 45" do
    expect(@teacher.age).to eql 45
  end

  it "confirms name of teacher not to be Mrs Cole" do
    expect(@teacher.name).not_to match 'Mrs Cole'
  end

  it "confirms specialization of teacher to be Maths" do
    expect(@teacher.specialization).to match 'Maths'
  end
end
