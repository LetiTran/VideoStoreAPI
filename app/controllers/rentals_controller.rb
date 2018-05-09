class RentalsController < ApplicationController
  def index
    @rentals = Rental.all

  end

  def show
    @rental = Rental.find_by(id: params[:id])

    if @rental.nil?
      render json: { ok: false, error: :not_found }, status: :not_found
    end
  end

  def create
    rental = Rental.create(rental_params)

    if rental.valid?
      rental.assign_due_date
      render json: { id: rental.id }, status: :ok
    else
      render json: {ok: false, errors: rental.errors}, status: :bad_request
    end

  end

  def update
    # ToDo
    # call upon check_in method from model
  end

  private

  def rental_params
    return  params.require(:rental).permit(:customer_id, :movie_id)
  end
end
