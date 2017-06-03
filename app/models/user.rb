# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :activities, dependent: :destroy

  enum status: %i[inactive active suspended]
  enum role: %i[normal moderator admin]

  validates :email, presence: true
  validates :username, presence: true
end
