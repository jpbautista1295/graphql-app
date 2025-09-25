# frozen_string_literal: true

module Mutations
  module Car
    class CreateCar < Mutations::BaseMutation
      argument :car, Types::Inputs::CarInputType, required: true

      field :car, Types::CarType, null: true
      field :errors, [String], null: false

      def resolve(car:)
        new_car = ::Car.new(car.to_h)

        if new_car.save
          { car: new_car, errors: [] }
        else
          { car: nil, errors: new_car.errors.full_messages }
        end
      end
    end
  end
end
