class AddTrackAndMapImageDataToActivities < ActiveRecord::Migration[5.0]
  def change
    remove_column :activities, :track_file_name
    remove_column :activities, :track_content_type
    remove_column :activities, :track_file_size
    remove_column :activities, :track_updated_at
    add_column :activities, :track_data, :text
    add_column :activities, :track_image_data, :text
  end
end
