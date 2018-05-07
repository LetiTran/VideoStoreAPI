class Rental < ApplicationRecord
  require 'date'

  ONE_WEEK = 7

  validates :due_date, :returned, :customer_id, :movie_id, presence: true

  belongs_to :costumer
  belongs_to :movie

  def assign_due_date
    self.due_date = Date.today + ONE_WEEK
  end

  def check_in
    if self.returned == false
      self.update_attributes(returned: true)
    end
  end
end
