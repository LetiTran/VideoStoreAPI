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


    # overdue_rentals = []
    # @customer_with_overdue ={}
    #
    # Customer.all.each do |customer|
    #   overdue_rentals << customer.rentals.where(returned: false)
    #   overdue_rentals.each do |rental|
    #     binding.pry
    #     if rental.due_date < Date.today
    #
    #       @customer_with_overdue[customer] = rental
    #
    #     end
    #   end
    # end
    # binding.pry

    overdue_rentals = []
    customers_with_overdue = []
    #
    #
    non_checked_in_rentals.each do |rental|
      if rental.due_date < Date.today
        # overdue_rentals << rental
         customers_with_overdue << Customer.find_by(id: rental.customer_id)

      end
    end


    unless customers_with_overdue.empty?
      @customer_with_overdue = customers_with_overdue
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
