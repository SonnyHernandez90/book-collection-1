require "rails_helper"

RSpec.describe Book, type: :model do
  it "accepts a title and rejects a blank title" do
    valid_book = Book.new(title: "The Pragmatic Programmer")
    blank_book = Book.new(title: "")

    expect(valid_book).to be_valid
    expect(blank_book).not_to be_valid
    expect(blank_book.errors[:title]).to include("can't be blank")
  end
end
