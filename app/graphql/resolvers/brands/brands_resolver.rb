module Resolvers
  module Brands
    class BrandsResolver < BaseResolver
      description "Get all brands"

      type [Types::BrandType], null: false

      def resolve
        Brand.all
      end
    end
  end
end