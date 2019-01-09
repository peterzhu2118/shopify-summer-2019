# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :all_products, [ProductType], null: true
    def all_products
      Product.all
    end
  end
end
