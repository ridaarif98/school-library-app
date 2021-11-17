require_relative '../book'

describe Book do
  before :each do
    @book = Book.new(title: 'Fairy Tales', author: 'Rida')
  end

  it 'shows instance of book class' do
    expect(@book).to be_instance_of Book
  end

  it 'confirms book title not to be Horror Stories' do
    expect(@book.title).not_to match 'Horror Stories'
  end

  it 'confirms book author to be Rida' do
    expect(@book.author).to match 'Rida'
  end
end
