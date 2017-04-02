class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email, null: false, unique: true
      t.jsonb :meta
      t.integer :status, null: false, default: 0
      t.string :avatar_url
      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
  end
end
