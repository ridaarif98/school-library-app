require './book'
require './person'
require './student'
require './teacher'
require './rental'

class CreateBooks
    attr_accessor :book

    def initialize
      @books = []
      @persons = []
      @rentals = []
    end

    def create_teacher
      print 'Age: '
      age = gets.chomp.to_i
      print 'Name: '
      name = gets.chomp
      print 'Specialization: '
      specialization = gets.chomp
      @persons.push(Teacher.new(age: age, specialization: specialization, name: name))
      puts('Person added successfully!')
    end

    def create_student
      print 'Age: '
      age = gets.chomp.to_i
      print 'Name: '
      name = gets.chomp
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

    def handle_book
      print 'Title: '
      title = gets.chomp
      print 'Author: '
      author = gets.chomp
      @books.push(Book.new(title: title, author: author))
      puts 'Book created'
    end

    def display_books
      puts 'All books are: '
      @books.each { |book| puts "Title: '#{book.title}', Author: #{book.author}" }
    end

    def create_rental
      puts 'Select a book from the following list: '
      @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
      select_book = gets.chomp.to_i
      book = @books[select_book]

      puts 'Select a person from the following list: '
      @persons.each_with_index do |person, index|
        puts "#{index}) [#{person.class.name.split('::').last}],
        Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
      select_person = gets.chomp.to_i
      person = @persons[select_person]

      print 'Date: '
      date = gets.chomp

      @rentals.push(Rental.new(date: date, person: person, book: book))
      puts 'Rental created successfully'
    end

    def display_rental
      print 'ID of person: '
      id = gets.chomp.to_i
      puts 'Rentals: '
      selected_rentals = @rentals.select { |rental| rental.person.id == id }
      selected_rentals.each do |s_rental|
        puts "Date: #{s_rental.date}, Book: #{s_rental.book.title} by #{s_rental.book.author}"
      end
    end
    end
