class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities, id: :uuid do |t|
      t.string :name, null: false
      t.text :description
      t.references :user, foreign_key: true, type: :uuid
      t.timestamps
    end
  end
end
