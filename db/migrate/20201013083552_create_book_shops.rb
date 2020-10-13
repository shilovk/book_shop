class CreateBookShops < ActiveRecord::Migration[6.0]
  def change
    create_table :book_shops do |t|
      t.string :type_of_position, null: false
      t.belongs_to :book
      t.belongs_to :shop

      t.timestamps
    end
  end
end
