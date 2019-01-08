# frozen_string_literal: true

class MarketplaceSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
