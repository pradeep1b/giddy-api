# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :badges_sashes
  has_many :sashes, through: :badges_sashes
end
