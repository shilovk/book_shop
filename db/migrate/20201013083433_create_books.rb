class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.belongs_to :publisher

      t.timestamps
    end
  end
end
