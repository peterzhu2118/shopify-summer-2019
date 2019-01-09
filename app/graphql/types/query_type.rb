# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :all_products, [ProductType], 'Get all the products.', null: true
    def all_products
      Product.all
    end

    field :all_carts, [CartType], 'Get all the carts that have not been purchased.', null: true
    def all_carts
      Cart.where(user: context[:current_user], purchased: false)
    end
  end
end
