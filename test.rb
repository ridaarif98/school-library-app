require './person'
require './teacher'
require './student'

person = Person.new(19, 'Muhammad Ali')
puts(person.name)
person.validate_name

puts(person.name)
