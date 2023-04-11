class RemoveFollowingIdFromRelationships < ActiveRecord::Migration[6.1]
  def change
    remove_column :relationships, :following_id, :integer
  end
end
