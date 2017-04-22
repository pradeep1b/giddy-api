class RemoveUserPasswordAndOauthFields < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :provider
    remove_column :users, :uid
    remove_column :users, :password_digest
  end
end
