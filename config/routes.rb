Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Devise routes with custom controllers
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'devise/passwords',
    registrations: 'devise/registrations'
  }
  
  # Dashboard routes
  get 'dashboard/therapist', to: 'therapist_dashboard#index', as: :therapist_dashboard
  get 'dashboard/patient', to: 'patient_dashboard#index', as: :patient_dashboard
  
  # Recursos gerenciados pelos terapeutas
  resources :patients
  resources :appointments
  resources :sessions, controller: 'therapy_sessions'
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Root path
  root "home#index"
end
