class ChangeUserEmailUniqueness < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :email, :string, unique: true, null: false
    add_index :users, :email, unique: true
  end
end
