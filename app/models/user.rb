# frozen_string_literal: true

class User < ApplicationRecord
  has_many :products
  has_many :carts
  validates_presence_of :username, :token
  validates_uniqueness_of :username

  before_validation :generate_api_token

  def generate_api_token
    self.token ||= SecureRandom.hex(64)
  end
end
