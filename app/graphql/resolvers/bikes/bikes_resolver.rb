module Resolvers
  module Bikes
    class BikesResolver < Types::Common::SearchableQueryType
      description "Get all bikes"

      scope { Bike.all }

      option :bike_type, type: String, required: false, with: :apply_bike_type

      type [Types::BikeType], null: true

      def apply_bike_type(scope, value)
        scope.where("bike_type ILIKE ?", escape_search_term(value)) if value.present?
      end
    end
  end
end