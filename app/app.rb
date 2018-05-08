get "/rentals", :provides => [:json, :xml] do
  @rentals = Rental.order("id DESC")
  render "rentals/index"
end
