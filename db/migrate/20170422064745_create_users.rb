class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users, id: :uuid do |t|
      # app
      t.string :email, null: false, unique: true
      t.string :nickname, null: false, unique: true
      t.jsonb :meta
      t.integer :status, null: false, default: 0

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :nickname, unique: true
  end
end
