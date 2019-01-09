# frozen_string_literal: true

module Types
  class ProductType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :price, Float, null: false
    field :inventory_count, Integer, null: false
  end
end
