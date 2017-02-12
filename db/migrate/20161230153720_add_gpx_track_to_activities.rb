class AddGpxTrackToActivities < ActiveRecord::Migration[5.0]
  def up
    add_attachment :activities, :gpx_track
  end

  def down
    remove_attachment :activities, :gpx_track
  end
end
