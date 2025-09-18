module Mutations
  module Bike
    class CreateBike < Mutations::BaseMutation
      argument :bike, Types::Inputs::BikeInputType, required: true

      field :bike, Types::BikeType, null: true
      field :errors, [String], null: false

      def resolve(bike:)
        new_bike = ::Bike.new(bike.to_h)

        if new_bike.save
          {
            bike: new_bike,
            errors: []
          }
        else
          {
            bike: nil,
            errors: new_bike.errors.full_messages
          }
        end
      end
    end
  end
end