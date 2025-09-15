#frozen_string_literal: true

class Bike < ApplicationRecord
  belongs_to :brand

  validates :model, presence: true
end