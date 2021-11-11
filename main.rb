require './book'
require './person.rb'
require './student'
require './teacher'
require './rental.rb'

class CreateBooks
  attr_accessor :book

  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @persons.push(Teacher.new(age: age, specialization: specialization,  name: name))
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parents permission? [Y/N]:  '
    parent_permission = gets.chomp != 'n'
    @persons.push(Student.new(age: age, classroom: 'Coding Class',  name: name, parent_permission:parent_permission))
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
    puts('Person added successfully!')
    puts
    run
  end

  def display_person
    @persons.each { |person| puts "[#{person.class.name.split('::').last}] Name: '#{person.name}', ID: #{person.id}, Age: '#{person.age}'," }
    puts
    run
  end

  def handle_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books.push(Book.new(title: title, author: author))
    puts 'Book created'
    run
  end

  def display_books
    @books.each { |book| puts "Title: '#{book.title}', Author: #{book.author}" }
    run
  end

  def create_rental
    print 'Select a book from the following list: '
    @books.each_with_index {|book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}"}
    select_book = gets.chomp.to_i
    book = @books[select_book]

    print 'Select a person from the following list: '
    @persons.each_with_index {|person, index| puts "#{index}) [#{person.class.name.split('::').last}], Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"}
    select_person = gets.chomp.to_i
    person = @persons[select_person]

    print 'Date: '
    date = gets.chomp

    @rentals.push(Rental.new(date: date, person: person, book: book))
    puts 'Rental created successfully'
    puts
    run
  end

  def run
    puts 'Please Choose an option by entrin a number:'
    choose_options = ['1- List all book', '2- List all People', '3- Create a Person', '4- Create a Book', '5- Create a Rental', '6- List all Rentals for given id','7- Exit']
    choose_options.map{|choose| puts choose}
    options = gets.chomp.to_i
    case options
    when 1
      # handle_book
      puts 'All books are:'
      display_books
    when 2
      puts 'List of all People:'
      display_person
    when 3
      puts 'Create a Person'
      handle_person
    when 4
      puts 'Create a book'
      handle_book
    when 5
      create_rental
    when 6
      puts 'List all rentals for given id'
    when 7
      puts 'Thanks for using this app!'
    end
  end
end

def main
  puts
  test = CreateBooks.new
  test.run
end

puts(main)
