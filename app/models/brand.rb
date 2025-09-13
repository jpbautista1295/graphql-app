#frozen_string_literal: true

class Brand < ApplicationRecord
  has_many :cars, dependent: :destroy
  
  validates :name, presence: true
end