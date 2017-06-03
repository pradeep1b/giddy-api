class CreateSashes < ActiveRecord::Migration
  def change
    create_table :sashes, id: :uuid do |t|
      t.references :user
      t.timestamps
    end
  end
end
