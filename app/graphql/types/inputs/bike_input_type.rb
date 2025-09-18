module Types::Inputs
  class BikeInputType < Types::BaseInputObject
    argument :brand_id, Integer, required: true
    argument :model, String, required: true
    argument :bike_type, String, required: true
    argument :amount, Float, required: true
    argument :currency, String, required: true
  end
end