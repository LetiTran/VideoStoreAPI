class CustomersController < ApplicationController
  def index
  end

  def create
  end

  def zomg
    message = "it works"
    render json: message.as_json
  end
end
