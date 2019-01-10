# frozen_string_literal: true

module Mutations
  class AddToCart < Mutations::BaseMutation
    null false

    description 'Adds a product to cart.'

    argument :cart_id, Integer, 'The ID of the cart that the product is being added to.', required: true
    argument :product_id, Integer, 'The ID of the product to add to the cart.', required: true

    field :cart, Types::CartType, 'The cart this product was added to.', null: true
    field :product, Types::ProductType, 'The product that was added to the cart', null: true
    field :errors, [String], 'Errors that prevented the product from being added, empty otherwise.', null: false

    def resolve(cart_id:, product_id:)
      cart = Cart.find_by(id: cart_id, user: context[:current_user])

      return { errors: ['Cart is not found.'] } if cart.nil?

      product = Product.find_by_id(product_id)

      return { errors: ['Product is not found.'] } if product.nil?

      cart_product = CartProduct.new(cart: cart, product: product)

      if cart_product.save
        {
          cart: cart,
          product: product,
          errors: []
        }
      else
        {
          cart: nil,
          product: nil,
          errors: cart_product.errors.full_messages
        }
      end
    end
  end
end
