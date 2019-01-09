# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_product, mutation: Mutations::CreateProduct
    field :create_cart, mutation: Mutations::CreateCart
    field :add_to_cart, mutation: Mutations::AddToCart
    field :purchase_cart, mutation: Mutations::PurchaseCart
  end
end
