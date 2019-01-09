# frozen_string_literal: true

module Mutations
  class CreateUser < Mutations::BaseMutation
    null true

    description 'Creates a new user.'

    argument :username, String, 'The unique username of the new user.', required: true

    field :user, Types::UserType, 'The user that was created.', null: true
    field :errors, [String], 'Errors that prevented the user from being created, empty otherwise.', null: false

    def resolve(username:)
      user = User.new(username: username)

      if user.save
        {
          user: user,
          errors: []
        }
      else
        {
          user: nil,
          errors: user.errors.full_messages
        }
      end
    end
  end
end
