# frozen_string_literal: true

class Activity < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :track, presence: true

  has_attached_file :track

  # rubocop:disable Style/AlignHash
  validates_attachment :track, presence: true,
    content_type: {content_type: ['application/xml', 'application/octet-stream']},
    size: {in: 0..25.megabytes}
end
