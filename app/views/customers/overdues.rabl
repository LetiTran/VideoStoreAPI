# collection @overdue_rentals
# attributes :id


collection @customer_with_overdue
attributes :id, :name, :registered_at, :phone, :address, :city, :state, :postal_code, :movies_checked_out_count

# child(:rentals, :if => lambda { |r| r.rentals == false }) { attributes :movie_id }
#

child :rentals, unless: lambda {|x| x.rentals == false } do |x|
  attributes :movie_id if x.returned == false
end

# child(:rentals){attributes :movie_id}
