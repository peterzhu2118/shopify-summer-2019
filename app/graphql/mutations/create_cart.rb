# frozen_string_literal: true

module Mutations
  class CreateCart < Mutations::BaseMutation
    null true

    description 'Creates a new cart.'

    field :cart, Types::CartType, 'The cart that was created.', null: true
    field :errors, [String], 'Errors that prevented the cart from being created, empty otherwise.', null: false

    def resolve
      cart = Cart.new(user: context[:current_user])

      if cart.save
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
