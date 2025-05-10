Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Resource para converter imagens BMP para PNG
  resources :image_converters, only: [:index, :show, :new, :create]

  # Defines the root path route ("/")
  root "home#index"
end
