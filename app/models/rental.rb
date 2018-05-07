class Rental < ApplicationRecord

  validates :due_date, :returned, :customer_id, :movie_id, presence: true

  belongs_to :costumer
  belongs_to :movie

end
