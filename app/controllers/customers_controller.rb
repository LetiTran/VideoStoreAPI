class CustomersController < ApplicationController

  def index
<<<<<<< HEAD
    @customers = Customer.all
=======
    customers = Customer.all
    render(json: customers.as_json(except: [:created_at, :updated_at]), status: :ok)
    # render json: customers, status: :ok
>>>>>>> 3ee9a9f35cb77e68c41a7607d6db16daa3e0fb31
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

  def zomg
    message = "it works"
    render json: message.as_json
  end
end

private
def customers_params
  params.require(:customer).permit(:name, :phone, :address, :city, :state, :postal_code)
end
