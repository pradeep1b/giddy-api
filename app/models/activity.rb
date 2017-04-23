# frozen_string_literal: true

class Activity < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :track, presence: true
  validates :user, presence: true

  has_attached_file :track

  validates_attachment :track, presence: true
  validates_attachment_content_type :track,
                                    content_type: %w[application/gpx+xml
                                                     text/xml
                                                     application/xml]
  validates_attachment_size :track, in: 0..25.megabytes
end
