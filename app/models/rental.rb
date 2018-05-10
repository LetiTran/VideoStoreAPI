class Rental < ApplicationRecord
  ONE_WEEK = 7

  validates :returned, inclusion: { in: [true, false] }

  belongs_to :customer
  belongs_to :movie

  def assign_due_date
    self.due_date = self.created_at.to_date + ONE_WEEK
  end

  # def check_in
  #   if self.returned == false
  #     self.update_attributes(returned: true)
  #   else
  #     return false
  #   end
  # end
end
