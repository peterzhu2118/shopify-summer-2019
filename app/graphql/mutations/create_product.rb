# frozen_string_literal: true

module Mutations
  class CreateProduct < Mutations::BaseMutation
    null false

    description 'Creates a new product.'

    argument :title, String, 'Title of the product.', required: true
    argument :price, Float, 'Price of the product.', required: true
    argument :inventory_count, Integer, 'Inventory count of the product.', required: true

    field :product, Types::ProductType, 'The product that was created.', null: true
    field :errors, [String], 'Errors that prevented the product from being created, empty otherwise.', null: false

    def resolve(title:, price:, inventory_count:)
      product = Product.new(user: context[:current_user], title: title, price: price, inventory_count: inventory_count)

      if product.save
        {
          product: product,
          errors: []
        }
      else
        {
          product: nil,
          errors: user.errors.full_messages
        }
      end
    end
  end
end
