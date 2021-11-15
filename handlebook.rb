require './book'
class HandleBooks
    attr_accessor :book

    def initialize
      @books = []
    end

    def create_book
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

end
