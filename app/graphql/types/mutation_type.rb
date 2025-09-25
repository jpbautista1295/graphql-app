# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_brand, mutation: Mutations::Brand::CreateBrand
    field :create_bike, mutation: Mutations::Bike::CreateBike
    field :create_car, mutation: Mutations::Car::CreateCar
  end
end
