class CustomersController < ApplicationController
  def index
  end

  def zomg
    message = "it works"
    render json: message.as_json
  end
end
