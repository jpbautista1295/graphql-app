# frozen_string_literal: true

module Types
  class BikeType < Types::BaseObject
    implements Types::PriceType
    implements Types::VehicleType

    field :bike_type, String, null: false
  end
end