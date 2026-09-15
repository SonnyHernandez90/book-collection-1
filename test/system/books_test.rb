require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
  end

  test "visiting the index" do
    visit books_url
    assert_selector "h1", text: "Book Collection"
  end

  test "should create book" do
    visit books_url
    click_on "Add a New Book"

    fill_in "Title", with: @book.title
    click_on "Create Book"

    assert_text "Book was successfully created"
  end

  test "should update Book" do
    visit books_url
    click_on "Update Book", match: :first

    fill_in "Title", with: @book.title
    click_on "Update Book"

    assert_text "Book was successfully updated"
  end

  test "should destroy Book" do
    visit books_url
    click_on "Delete Book", match: :first
    click_on "Confirm Delete"

    assert_text "Book was successfully destroyed"
  end
end
