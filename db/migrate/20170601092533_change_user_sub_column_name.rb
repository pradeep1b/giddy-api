class ChangeUserSubColumnName < ActiveRecord::Migration[5.0]
  def change
    change_column_null :users, :sub, true
    rename_column :users, :sub, :facebook_sub
    add_column :users, :google_sub, :string, unique: true, null: true
  end
end
