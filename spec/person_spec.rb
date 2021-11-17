require_relative '../person'
require_relative '../corrector'

describe Person do 
    before(:each) do 
        @corrector = Corrector.new 
        @person  = Person.new( age: 19, name: 'ahmedaliahmed', parent_permission: false ) 
    end 

    it " show instance of person class" do
        expect(@person).to be_instance_of Person
    end

    it "shows correct name format" do
        expect(@person.validate_name).to match 'Ahmedaliah'
    end

    it "does not show correct name format" do
        expect(@person.validate_name).not_to match 'ahmedaliahmed'
    end

    it "return true for use_services method" do
        expect(@person.can_use_services?).to be true
    end

    it "return false for use_services method" do
        person  = Person.new( age: 16, name: 'ahmedaliahmed', parent_permission: false )
        expect(person.can_use_services?).to be false
    end

end