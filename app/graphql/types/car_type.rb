# frozen_string_literal: true

module Types
  class CarType < Types::BaseObject
    implements Types::PriceType
    implements Types::VehicleType

    field :num_of_doors, Integer, null: false
    field :min_doors, Integer, null: true
    field :max_doors, Integer, null: true
  end
end
