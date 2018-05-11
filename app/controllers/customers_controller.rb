class CustomersController < ApplicationController
  def zomg
    message = "it works"
    render json: message.as_json
  end

  def index
    params[:sort] ? (sort = params[:sort].to_sym) : sort = :id

    @customers = Customer.order(sort).paginate(page: params[:p], per_page: params[:n])
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

  def overdues
    non_checked_in_rentals = Rental.where(returned: false)
    overdue_rentals = []

    non_checked_in_rentals.each do |rental|
      if rental.due_date < Date.today
        overdue_rentals << rental
      end
    end

    unless overdue_rentals.empty?
      @overdue_rentals = overdue_rentals
    else
      render json: {ok: false, errors: "There are no overdue rentals"}, status: :bad_request
    end
  end

  # (Show not required)
  def show
    @customer = Customer.find_by(id: params[:id])
    render json: {ok: false, error: :not_found}, status: :not_found if @customer.nil?
  end

  private
  def customers_params
    params.permit(:name, :phone, :address, :city, :state, :postal_code, :p, :n, :sort)
  end
end
