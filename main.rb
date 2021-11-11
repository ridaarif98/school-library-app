require './book'
# require './person'
# require './student'
# require './teacher'

class CreateBooks
  attr_accessor :book

  def initialize
    @books = []
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

  def run
    puts 'Please Choose an option by entrin a number:'
    choose_options = ['1- List all book', '2- List all People', '3- Create a Person', '4- Create a Book', '5- Create a Rental', '6- List all Rentals for given id','7- Exit']
    choose_options.map{|choose| puts choose}
    options = gets.chomp.to_i
    case options
    when 1
      # handle_book
      print 'All books are:'
      display_books
    when 2
      # display_books
      print 'List of all People:'
    when 3
      puts 'Create a Person'
    when 4
      puts 'Create a book'
      handle_book
    when 5
      puts 'Create a rental'
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
