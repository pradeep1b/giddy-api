class AddNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    rename_column :users, :username, :nickname
  end
end
