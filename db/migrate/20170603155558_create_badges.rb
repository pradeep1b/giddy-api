class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges, id: :uuid do |t|
      t.string :name, null: false
      t.text :description
      t.text :image_data
      t.timestamps
    end
  end
end
