Rails.application.routes.draw do

  get '/zomg', to: "customers#index"

  resources :movies, only: [:index, :show, :create]

  resources :customers, only: :index

  resources :rentals, only: [:index, :show, :create, :update]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
