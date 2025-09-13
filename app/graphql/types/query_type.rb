# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :get_brands, resolver: Resolvers::Brands::BrandsResolver
  end
end
