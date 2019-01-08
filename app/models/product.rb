# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :user
  validates_presence_of :title
  validates :inventory_count, presence: true, numerically: { greater_than_or_equal_to: 0 }
  validates :price, presence: true, numerically: { greater_than_or_equal_to: 0 }
end
