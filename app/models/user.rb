# frozen_string_literal: true

class User < ApplicationRecord
  has_many :activities

  enum status: %i(active suspended deleted)

  validates :name, presence: true
  validates :email, presence: true
end
