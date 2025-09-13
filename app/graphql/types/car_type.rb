# frozen_string_literal: true

module Types
  class CarType < Types::BaseObject
    implements Types::PriceType
    implements Types::VehicleType

    field :num_of_doors, Integer, null: false
  end
end
