module Types::Inputs
  class BrandInputType < Types::BaseInputObject
    argument :name, String, required: true
  end
end