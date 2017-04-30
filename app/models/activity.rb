# frozen_string_literal: true

class Activity < ApplicationRecord
  include TrackUploader::Attachment.new(:track)
  include ImageUploader::Attachment.new(:track_image)

  belongs_to :user

  validates :name, presence: true
  validates :user, presence: true
end
