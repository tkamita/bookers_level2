class CreateBookComments < ActiveRecord::Migration[5.2]
  def change
    create_table :book_comments do |t|
      t.text :comment, null: false
      t.integer :user_id, foreign_key: true,  null: false
      t.integer :book_id, foreign_key: true,  null: false

      t.timestamps
    end
  end
end
