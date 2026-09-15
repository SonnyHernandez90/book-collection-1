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
end
