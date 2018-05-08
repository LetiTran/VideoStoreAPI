class RentalsController < ApplicationController
  def index
    @rentals = Rental.all
    
  end

  def show
    @rental = Rental.first
  end

  def create
  end

  def update
  end
end
