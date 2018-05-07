Rails.application.routes.draw do
  get 'rentals/index'

  get 'rentals/show'

  get 'rentals/create'

  get 'rentals/update'

  get 'movies/index'

  get 'movies/show'

  get 'movies/create'

  get 'customers/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
