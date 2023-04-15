class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.integer :customer_id, null: false
      t.string :name, null: false
      t.text :introduction, null: false
      t.timestamps
    end
  end
end
