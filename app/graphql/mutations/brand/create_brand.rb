module Mutations
  module Brand
    class CreateBrand < Mutations::BaseMutation
      argument :brand, Types::Inputs::BrandInputType, required: true

      field :brand, Types::BrandType, null: true
      field :errors, [String], null: false

      def resolve(brand:)
        new_brand = ::Brand.new(brand.to_h)

        if new_brand.save
          {
            brand: new_brand,
            errors: []
          }
        else
          {
            brand: nil,
            errors: new_brand.errors.full_messages
          }
        end
      end
    end
  end
end