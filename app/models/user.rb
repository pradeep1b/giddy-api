# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :activities, dependent: :destroy

  enum status: %i[inactive active suspended]
  enum role: %i[normal moderator admin]

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  before_create :confirmation_token

  def email_activate!
    self.email_confirmed = true
    self.confirm_token = nil
    self.status = :active
    save!(validate: false)
  end

  private

  def confirmation_token
    self.confirm_token = SecureRandom.urlsafe_base64.to_s if confirm_token.blank?
  end
end
