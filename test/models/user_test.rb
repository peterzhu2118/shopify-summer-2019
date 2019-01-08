# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'creating a user generates an API token' do
    user = create(:user, token: nil)

    refute_nil user.token
    assert_equal 128, user.token.length
  end
end
