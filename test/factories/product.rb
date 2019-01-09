# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    association :user, factory: :user
    title { Faker::Lorem.sentence }
    price { Faker::Number.decimal(2).to_f }
    inventory_count { Faker::Number.number(10).to_i }
  end
end
