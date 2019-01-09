# frozen_string_literal: true

FactoryBot.define do
  factory :cart_product do
    association :cart, factory: :cart
    association :product, factory: :product
  end
end
