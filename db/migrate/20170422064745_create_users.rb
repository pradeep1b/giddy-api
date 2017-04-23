class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users, id: :uuid do |t|
      # app
      t.string :email, null: false
      t.string :username, null: false, unique: true
      t.jsonb :meta
      t.integer :status, null: false, default: 0

      t.timestamps null: false
    end

    add_index :users, :username, unique: true
  end
end
