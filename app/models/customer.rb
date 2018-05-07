class Customer < ApplicationRecord
  validates :name, :registered_at, :phone, :address, :city, :state, :postal_code, presence: true

  has_many :rentals

  def movies_checked_out_count
    return Rental.where(customer_id: self.id, returned: false).count
  end
end
