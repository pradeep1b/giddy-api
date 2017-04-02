class AddTrackToActivities < ActiveRecord::Migration[5.0]
  def up
    add_attachment :activities, :track
  end

  def down
    remove_attachment :activities, :track
  end
end
