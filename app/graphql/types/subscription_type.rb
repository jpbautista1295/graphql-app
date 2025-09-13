# frozen_string_literal: true

module Types
  class SubscriptionType < Types::BaseObject
    field :new_car, subscription: Subscriptions::NewCar
  end
end