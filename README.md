# Welcome, Shopify!

This is my solution to the summer 2019 Shopify Developer Intern challenge. The GraphQL endpoint of a hosted version is available at [https://shopify-challenge.peterzhu.ca/graphql](https://shopify-challenge.peterzhu.ca/graphql) (the root page just redirects back to this GitHub repo).

**NOTE**: Requests to the GraphQL endpoint should be a POST request.

This GraphQL API allows users to be created, these users can then create products which other uses can place in their cart and purchase.

# Setup

0. Install the following dependencies:
    - Ruby
    - Ruby on Rails
    - PostgreSQL
1. Install the dependencies using `bundle install`.
2. Setup the database using `rails db:create` followed by `rails db:migrate`.
    - Optionally run `rails db:seed` to create the user `testing` with API token `af5f6ad39d4bfba41c0a0b5b355b02ee65958a0c9adad4d2a70b67d72b8f425c`.
3. Start the server using `rails server`! The GraphQL endpoint will be available at `\graphql`, a GraphiQL IDE is also available in development at `\graphiql`.
    - Note on the GraphiQL IDE: The header is configured to pass the API token for the `testing` user generated from the seed in the [environment configuration](https://github.com/peterzhu2118/shopify-summer-2019/blob/master/config/environments/development.rb#L72).

# Using the API

A default user with API token `af5f6ad39d4bfba41c0a0b5b355b02ee65958a0c9adad4d2a70b67d72b8f425c` is already created for you. Alternatively, you can also create a new user through the GraphQL API.

This project is also available hosted, with the GraphQL endpoint available at [https://shopify-challenge.peterzhu.ca/graphql](https://shopify-challenge.peterzhu.ca/graphql).

## Authentication

Authenticate by placing the API token in the headers as `HTTP_API_TOKEN`. For example, to perform an API call as the user `testing` use the following cURL command `curl -H "Api-Token: af5f6ad39d4bfba41c0a0b5b355b02ee65958a0c9adad4d2a70b67d72b8f425c" -X POST https://shopify-challenge.peterzhu.ca/graphql`.

Note: `createUser` is the only GraphQL method that is not protected by authentication (i.e. you can create users without providing an API token).

## API Documentation

Full documentation can be found [here](https://www.peterzhu.ca/shopify-summer-2019/).
