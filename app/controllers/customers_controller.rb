class CustomersController < ApplicationController

  def index
    @customers = Customer.all
    # render(json: customers.as_json(except: [:created_at, :updated_at]), status: :ok)
    # render json: customers, status: :ok
  end

  def create
    customer = Customer.create(customers_params)
    customer.assign_registered_date

    if customer.valid?
      render json: {id: customer.id}, status: :ok
    else
      render json: {ok: false, errors: customer.errors}, status: :bad_request
    end
  end

  # (Show not required)
  def show
    @customer = Customer.find_by(id: params[:id])
    if @customer.nil?
      render json: {ok: false, error: :not_found}, status: :not_found
    end
  end

  def zomg
    message = "it works"
    render json: message.as_json
  end
end

private
def customers_params
  params.require(:customer).permit(:name, :phone, :address, :city, :state, :postal_code)
end
