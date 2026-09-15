require "rails_helper"

RSpec.describe Book, type: :model do
  it "accepts a title and rejects a blank title" do
    valid_book = Book.new(title: "The Pragmatic Programmer")
    blank_book = Book.new(title: "")

    expect(valid_book).to be_valid
    expect(blank_book).not_to be_valid
    expect(blank_book.errors[:title]).to include("can't be blank")
  end

  it "stores an author" do
    book = Book.new(title: "Clean Code", author: "Robert C. Martin")

    expect(book.author).to eq("Robert C. Martin")
  end

  it "stores a numerical price" do
    book = Book.new(title: "Clean Code", price: 39.99)

    expect(book.price).to eq(39.99)
  end

  it "stores a published date" do
    date = Date.new(2008, 8, 1)
    book = Book.new(title: "Clean Code", published_date: date)

    expect(book.published_date).to eq(date)
  end
end
