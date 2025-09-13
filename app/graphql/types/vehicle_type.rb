# frozen_string_literal: true

module Types::VehicleType
  include Types::BaseInterface

  field :id, ID, null: false
  field :model, String, null: false
  field :brand, Types::BrandType, null: false
end