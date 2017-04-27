class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at, :url, :description

  def url
    object.try(:track).try(:url)
  end
end
