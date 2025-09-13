# frozen_string_literal: true

module Types::PriceType
  include Types::BaseInterface

  field :amount, Float, null: false
  field :currency, String, null: false
end