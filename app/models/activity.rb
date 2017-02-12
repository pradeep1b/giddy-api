class Activity < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :gpx_track, presence: true

  has_attached_file :gpx_track

  # rubocop:disable Style/AlignHash
  validates_attachment :gpx_track, presence: true,
    content_type: { content_type: ['application/xml', 'application/octet-stream'] },
    size: { in: 0..25.megabytes }
end
