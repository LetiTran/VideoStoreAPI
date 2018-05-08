class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def create
  end

  def zomg
    message = "it works"
    render json: message.as_json
  end
end
