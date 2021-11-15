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
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Specialization: '
      specialization = gets.chomp
      @persons.push(Teacher.new(age: age, specialization: specialization, name: name))
      puts('Person added successfully!')
      puts
    #   menu
    end
  
    def create_student
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Has parents permission? [Y/N]:  '
      parent_permission = gets.chomp != 'n'
      @persons.push(Student.new(age: age, classroom: 'Coding Class', name: name, parent_permission: parent_permission))
      puts('Person added successfully!')
      puts
    #   menu
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
      # puts('Person added successfully!')
      puts
    #   menu
    end
  
    def display_person
      puts 'All persons are: '
      @persons.each do |person|
        puts "[#{person.class.name.split('::').last}] Name: '#{person.name}', ID: #{person.id}, Age: '#{person.age}',"
      end
      puts
    #   menu
    end
  
    def handle_book
      print 'Title: '
      title = gets.chomp
      print 'Author: '
      author = gets.chomp
      @books.push(Book.new(title: title, author: author))
      puts 'Book created'
      puts
    #   menu
    end
  
    def display_books
      puts 'All books are: '
      @books.each { |book| puts "Title: '#{book.title}', Author: #{book.author}" }
      puts
    #   menu
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
      puts
    #   menu
    end
  
    def display_rental
      print 'ID of person: '
      id = gets.chomp.to_i
      puts 'Rentals: '
      selected_rentals = @rentals.select { |rental| rental.person.id == id }
      selected_rentals.each do |s_rental|
        puts "Date: #{s_rental.date}, Book: #{s_rental.book.title} by #{s_rental.book.author}"
      end
      puts
    #   menu
    end
  
    def choice_selection
      puts 'Please Choose an option by entrin a number:'
      choose_options = ['1- List all book', '2- List all People', '3- Create a Person', '4- Create a Book',
                        '5- Create a Rental', '6- List all Rentals for given id', '7- Exit']
      choose_options.map { |choose| puts choose }
      # options = gets.chomp.to_i
    end
  
    def menu
      choice_selection
      options = gets.chomp.to_i
      case options
      when 1
        display_books
        menu
      when 2
        display_person
        menu
      when 3
        puts 'Create a Person'
        handle_person
        menu
      when 4
        puts 'Create a book'
        handle_book
        menu
      when 5
        create_rental
        menu
      when 6
        display_rental
        menu
      else
        puts 'Thanks for using this app!'
      end
    end
  end
  