require_relative '../corrector'

describe Corrector do

    it "check  it is instance of corrector class" do
        corrector = Corrector.new
        expect(corrector).to be_instance_of Corrector
    end

    it "validates name to correct format" do
        correct = Corrector.new
        name = 'aliahmedali'
        expect(correct.correct_name(name)).to match 'Aliahmedal'
    end

    it "validates nil values" do
        correct = Corrector.new
        expect(correct.correct_name('')).to eql ''
    end

end