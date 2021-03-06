class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.text :content
      t.integer :post_id, null: false

      t.timestamps
    end
    add_index :comments, :id
    add_index :comments, :user_id
    add_index :comments, :post_id
  end
end
