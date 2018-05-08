require "test_helper"
require "date"

describe Rental do
  before do
    rental = {
      "due_date" => Date.today + 7,
      "returned" => false,
      "customer" => customers(:shelley),
      "movie" => movies(:blacksmith)
    }
    @new_rental = Rental.new(rental)
  end

  it "must be valid" do
    value(@new_rental).must_be :valid?
  end
end
