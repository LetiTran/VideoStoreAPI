class CustomersController < ApplicationController

  def zomg
    message = "it works"
    render json: message.as_json
  end

  def index
    @customers = Customer.all
  end

  def create
    customer = Customer.create(customers_params)

    if customer.valid?
      customer.assign_registered_date
      render json: {id: customer.id}, status: :ok
    else
      render json: {ok: false, errors: customer.errors}, status: :bad_request
    end
  end

  # (Show not required)
  def show
    @customer = Customer.find_by(id: params[:id])
    render json: {ok: false, error: :not_found}, status: :not_found if @customer.nil?
  end

  private
  def customers_params
    params.require(:customer).permit(:name, :phone, :address, :city, :state, :postal_code)
  end
end
