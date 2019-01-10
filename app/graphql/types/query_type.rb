# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :all_products, [ProductType], null: true do
      description 'Get all the products.'
      argument :in_stock, Boolean, 'Display only the products in stock', required: false
    end
    def all_products(in_stock: false)
      if in_stock
        Product.where('inventory_count > 0')
      else
        Product.all
      end
    end

    field :product, ProductType, null: true do
      description 'Get all the products.'
      argument :product_id, Integer, 'ID of the product to show.', required: true
    end
    def product(product_id:)
      Product.find_by_id(product_id)
    end

    field :all_carts, [CartType], 'Get all the carts that have not been purchased.', null: true
    def all_carts
      Cart.where(user: context[:current_user], purchased: false)
    end
  end
end
