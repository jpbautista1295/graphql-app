# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :get_brands, resolver: Resolvers::Brands::BrandsResolver
    field :get_bikes, resolver: Resolvers::Bikes::BikesResolver
    field :get_cars, resolver: Resolvers::Cars::CarsResolver
    field :vehicles, [Types::VehicleUnion], null: false

    def vehicles
      Bike.all + Car.all
    end
  end
end
