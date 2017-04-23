class AddAuth0ToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :sub, :string, unique: true, null: false
    add_column :users, :picture, :string

    add_index :users, :sub, unique: true
  end
end
