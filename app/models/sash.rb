# frozen_string_literal: true

class Sash < ApplicationRecord
  belongs_to :user
  has_many :badges_sashes
  has_many :badges, through: :badges_sashes
end
