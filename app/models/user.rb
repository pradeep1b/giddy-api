# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :activities

  enum status: %i(active suspended deleted)

  validates :email, presence: true
  validates :nickname, presence: true
end
