Rails.application.routes.draw do

  # Create a route that responds to /zomg that serves a json-encoded "it works!" :

  # Route::get('/zomg', function(){
  #   return 'it works!';
  #   });
  #
  # get '/zomg', res.json({ message: 'it works!' })

  # get '/zomg', 

  resources :movies, only: [:index, :show, :create]

  resources :customers, only: :index

  resources :rentals, only: [:index, :show, :create, :update]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
