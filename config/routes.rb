Rails.application.routes.draw do
  resources :image_conversions, only: [:new, :create, :show] do
    member do
      get :download
    end
  end
  root "image_conversions#new"
end
