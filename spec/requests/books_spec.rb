require "rails_helper"

RSpec.describe "Books", type: :request do
  it "creates a valid book and rejects a blank title with flash notices" do
    expect do
      post books_path, params: {
        book: { title: "The Pragmatic Programmer" }
      }
    end.to change(Book, :count).by(1)

    expect(response).to redirect_to(books_path)
    expect(flash[:notice]).to eq("Book was successfully created.")

    expect do
      post books_path, params: {
        book: { title: "" }
      }
    end.not_to change(Book, :count)

    expect(response).to have_http_status(:unprocessable_content)
    expect(flash[:alert]).to eq("Title cannot be blank.")
  end

  it "creates a book with an author" do
    post books_path, params: {
      book: { title: "Clean Code", author: "Robert C. Martin" }
    }

    expect(Book.last.author).to eq("Robert C. Martin")
  end

  it "creates a book with a numerical price" do
    post books_path, params: {
      book: { title: "Clean Code", price: 39.99 }
    }

    expect(Book.last.price).to eq(39.99)
  end

  it "creates a book with a published date" do
    date = Date.new(2008, 8, 1)

    post books_path, params: {
      book: { title: "Clean Code", published_date: date }
    }

    expect(Book.last.published_date).to eq(date)
  end
end
