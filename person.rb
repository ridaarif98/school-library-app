class Person
	attr_reader :id
	attr_accessor :name, :age

	def initialize(name ="Unknown", age, parent_permission: true)
		@id = Random.rand(1..1000)
		@name = name
		@age = age
		@parent_permission = parent_permission
	end

	def can_use_survive
		if age >= 18 || parent_permission == true
			true
		else
			false
		end
	end

	private 
	def is_of_age
		@age >= 18
	end

end

person = Person.new("Rida", 22,)
puts(person.can_use_survive)