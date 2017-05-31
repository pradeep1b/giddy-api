class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :created_at, :updated_at, :track_url,
             :track_image_url
end
