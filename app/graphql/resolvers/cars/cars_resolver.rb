# frozen_string_literal: true

module Resolvers
  module Cars
    class CarsResolver < Types::Common::SearchableQueryType
      description "Get all cars"

      scope { ::Car.all }

      option :num_of_doors, type: Integer, required: false, with: :apply_num_of_doors
      option :min_doors, type: Integer, required: false, with: :apply_min_doors
      option :max_doors, type: Integer, required: false, with: :apply_max_doors

      type [Types::CarType], null: true

      def apply_num_of_doors(scope, value)
        value.present? ? scope.where(num_of_doors: value) : scope
      end

      def apply_min_doors(scope, value)
        value.present? ? scope.where("num_of_doors >= ?", value) : scope
      end

      def apply_max_doors(scope, value)
        value.present? ? scope.where("num_of_doors <= ?", value) : scope
      end
    end
  end
end
