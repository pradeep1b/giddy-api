# frozen_string_literal: true

class User < ApplicationRecord
  has_many :activities, dependent: :destroy

  enum status: %i[inactive active suspended]

  validates :email, presence: true
  validates :username, presence: true
  validates :sub, presence: true, uniqueness: true

  def self.from_token_payload(payload)
    return unless payload['email_verified']
    find_or_create_by!(sub: payload['sub']) do |user|
      user.username = payload['name']
      user.email = payload['email']
      user.picture = payload['picture']
      user.status = 'active' if payload['email_verified']
    end
  end
end
