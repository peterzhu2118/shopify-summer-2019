# frozen_string_literal: true

module Mutations
  class PurchaseCart < Mutations::BaseMutation
    null true

    description 'Completes the purchase of the cart.'

    argument :cart_id, Integer, 'The ID of the cart to purchase.', required: true

    field :cart, Types::CartType, 'The cart that was purchased.', null: true
    field :errors, [String], 'Errors that prevented the cart from being purchased, empty otherwise.', null: false

    def resolve(cart_id:)
      cart = Cart.find_by(id: cart_id, user: context[:current_user])

      return { errors: ['Cart is not found.'] } if cart.nil?

      if cart.purchase_cart
        {
          cart: cart,
          errors: []
        }
      else
        {
          cart: nil,
          errors: cart.errors.full_messages
        }
      end
    end
  end
end
