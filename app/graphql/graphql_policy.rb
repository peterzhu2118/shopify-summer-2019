# frozen_string_literal: true

class GraphqlPolicy
  def self.guard(type, field)
    if type.introspection? || skip_api_token_validation?(type, field)
      ->(_obj, _args, _ctx) { true }
    else
      ->(_obj, _args, ctx) { !ctx[:current_user].nil? }
    end
  end

  SKIP_TOKEN_VALIDATION_POLICY = {
    Types::MutationType => [:createUser]
  }.freeze

  def self.skip_api_token_validation?(type, field)
    SKIP_TOKEN_VALIDATION_POLICY[type]&.include? field
  end
end
