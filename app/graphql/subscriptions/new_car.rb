class Subscriptions::NewCar < Subscriptions::BaseSubscription
  field :car, Types::CarType, null: false
end