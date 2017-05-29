class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :created_at, :updated_at, :track_url,
             :track_image_url

  # TODO Refactor
  def track_url
    return 'http://localhost:3000' + object.track_url if Rails.env.development? && object.track_url
    object.track_url
  end

  def track_image_url
    return 'http://localhost:3000' + object.track_image_url if Rails.env.development? && object.track_image_url
    object.track_image_url
  end
end
