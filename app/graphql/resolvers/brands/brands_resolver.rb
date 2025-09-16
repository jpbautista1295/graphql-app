module Resolvers
  module Brands
    class BrandsResolver < Types::Common::SearchableQueryType
      description "Get all brands"

      scope { Brand.all }

      option :name, type: String, required: false, with: :apply_name

      type [Types::BrandType], null: true

      def apply_name(scope, value)
        scope.where("name ILIKE ?", escape_search_term(value)) if value.present?
      end
    end
  end
end