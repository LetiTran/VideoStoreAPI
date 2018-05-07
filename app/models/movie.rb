class Movie < ApplicationRecord
validates :title, :release_date, :overview, presence: true

has_many :rentals
end
