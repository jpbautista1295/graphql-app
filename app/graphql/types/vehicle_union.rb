module Types
  class VehicleUnion < Types::BaseUnion
    description "Represents either a Bike or a Car"
    possible_types Types::BikeType, Types::CarType

    def self.resolve_type(object, _context)
      case object
      when Bike
        Types::BikeType
      when Car
        Types::CarType
      else
        raise "Unknown Vehicle type"
      end
    end
  end
end