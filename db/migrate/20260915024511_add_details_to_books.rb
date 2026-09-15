class AddDetailsToBooks < ActiveRecord::Migration[8.1]
  def change
    add_column :books, :price, :decimal
    add_column :books, :published_date, :date
  end
end
