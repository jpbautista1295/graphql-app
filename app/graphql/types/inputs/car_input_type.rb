# frozen_string_literal: true

module Types
  module Inputs
    class CarInputType < Types::BaseInputObject
      argument :brand_id, Integer, required: true
      argument :model, String, required: true
      argument :num_of_doors, Integer, required: true
      argument :amount, Float, required: true
      argument :currency, String, required: true
    end
  end
end
