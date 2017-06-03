# frozen_string_literal: true

class BadgesSash < ApplicationRecord
  belongs_to :badge
  belongs_to :sash
end
