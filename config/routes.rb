# frozen_string_literal: true

Rails.application.routes.draw do
  root to: redirect('https://github.com/peterzhu2118/shopify-summer-2019')

  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
  post '/graphql', to: 'graphql#execute'
end
