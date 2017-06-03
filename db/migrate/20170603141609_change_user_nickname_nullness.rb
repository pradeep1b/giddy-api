class ChangeUserNicknameNullness < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :nickname, :string, null: true
    change_column :users, :name, :string, null: false
  end
end
