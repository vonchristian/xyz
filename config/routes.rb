Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  resources :books, only: [:index]

  namespace :api do
    resources :books, only: [:show]
  end

end
