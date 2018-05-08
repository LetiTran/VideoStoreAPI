require "test_helper"

describe Customer do

  describe 'validates' do

    let(:shelly) { customers(:shelly) }

    it "must be valid" do
      value(shelly).must_be :valid?
    end

    it "must have a name" do

    end

    it "must have a registered_at date" do

    end

    it "must have a phone" do

    end



  end
end


# validates :name, :registered_at, :phone, :address, :city, :state, :postal_code, presence: true
