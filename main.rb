require_relative 'refactor'
require_relative 'handleperson'

class Menu
  def initialize
    @create = CreateBooks.new
    @person = HandlePerson.new
  end

  def choice_selection
    puts 'Please Choose an option by entrin a number:'
    choose_options = %(1- List all book
      2- List all People
      3- Create a Person
      4- Create a Book
      5- Create a Rental
      6- List all Rentals for given id
      7- Exit).split('\n')
    choose_options.map { |choose| puts choose }
  end

  def menu
    choice_selection
    options = gets.chomp.to_i
    case options
    when 1
      @create.display_books
      menu
    when 2
      @person.display_person
      menu
    when 3
      puts 'Create a Person'
      @person.handle_person
      menu
    when 4
      puts 'Create a book'
      @create.handle_book
      menu
    when 5
      @create.create_rental
      menu
    when 6
      @create.display_rental
      menu
    else
      puts 'Thanks for using this app!'
    end
  end
end

def main
  puts 'Welcome to School Library App!'

  puts
  test = Menu.new
  test.menu
end

puts(main)