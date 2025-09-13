#frozen_string_literal: true

class Car < ApplicationRecord
  belongs_to :brand

  validates :model, presence: true
  validates :num_of_doors, presence: true, numericality: { only_integer: true, greater_than: 0 }

  after_create_commit :broadcast_vehicle
  
  private
  
  def broadcast_vehicle
    # Trigger the GraphQL subscription
    GraphqlAppSchema.subscriptions.trigger(
      :new_car,
      {},
      { car: self.as_json(include: :brand) }
    )
  end
end