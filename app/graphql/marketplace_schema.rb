# frozen_string_literal: true

class MarketplaceSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
  use GraphQL::Guard.new(policy_object: GraphqlPolicy)
end
