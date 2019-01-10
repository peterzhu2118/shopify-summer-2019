# frozen_string_literal: true

module Mutations
  class CreateUser < Mutations::BaseMutation
    null false

    description 'Creates a new user.'

    argument :username, String, 'The unique username of the new user.', required: true

    field :user, Types::UserType, 'The user that was created.', null: true
    field :errors, [String], 'Errors that prevented the user from being created, empty otherwise.', null: false

    def resolve(username:)
      user = User.new(username: username)

      context[:skip_guard] = true

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
