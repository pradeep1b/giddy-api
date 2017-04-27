class AddDescriptionToActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :description, :text
  end
end
