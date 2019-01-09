# frozen_string_literal: true

module Types
  class CartType < Types::BaseObject
    field :id, ID, null: false
    field :total_price, Float, null: false
    field :products, [ProductType], null: true
  end
end
