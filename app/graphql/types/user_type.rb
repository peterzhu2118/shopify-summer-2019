# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :username, String, null: false
    field :token, String, null: true
  end
end
