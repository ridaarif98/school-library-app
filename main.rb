require './refactor'

def main
  puts 'Welcome to School Library App!'
  
  puts
  test = CreateBooks.new
  test.menu
end

puts(main)
