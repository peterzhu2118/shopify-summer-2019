# Welcome, Shopify!

This is my solution to the summer 2019 Shopify Developer Intern challenge.

This GraphQL API allows users to be created, these users can then create products which other uses can place in their cart and purchase.

# Setup

0. Install the following dependencies:
  - Ruby
  - Ruby on Rails
  - PostgreSQL
1. Install the dependencies using `bundle install`.
2. Setup the database using `rails db:create` followed by `rails db:migrate`.
  - Optionally run `rails db:seed` to create the user `testing` with API token `af5f6ad39d4bfba41c0a0b5b355b02ee65958a0c9adad4d2a70b67d72b8f425c`.
3. Start the server using `rails server`!

# Using the API

## Authentication

Authenticate by placing the API token in the headers as `HTTP_API_TOKEN`. For example, to perform an API call as the user `testing` use the following cURL command `curl -H "Api-Token: af5f6ad39d4bfba41c0a0b5b355b02ee65958a0c9adad4d2a70b67d72b8f425c" -X POST https://shopify-challenge.peterzhu.ca/graphql`.

## API Documentation

Full documentation can be found [here](https://www.peterzhu.ca/shopify-summer-2019/).
