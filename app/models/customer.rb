class Customer < ApplicationRecord
  validates :name, :registered_at, :phone, :address, :city, :state, :postal_code, presence: true

  has_many :rentals
end
