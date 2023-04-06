class AddNameProfileToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :profile, :text #追記
  end
end
