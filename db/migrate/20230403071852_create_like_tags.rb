class CreateLikeTags < ActiveRecord::Migration[6.1]
  def change
    create_table :like_tags do |t|
      t.integer :like_id, null: false
      t.integer :tag_id, null: false
      t.timestamps
    end
  end
end
