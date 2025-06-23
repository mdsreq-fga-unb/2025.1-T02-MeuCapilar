Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Rotas específicas para login/cadastro por tipo de usuário dentro do devise_scope
  devise_scope :user do
    get '/terapeuta/login', to: 'users/sessions#new', defaults: { user_type: 'terapeuta' }, as: 'terapeuta_login'
    get '/terapeuta/cadastro', to: 'users/registrations#new', defaults: { user_type: 'terapeuta' }, as: 'terapeuta_cadastro'
    get '/paciente/login', to: 'users/sessions#new', defaults: { user_type: 'paciente' }, as: 'paciente_login'
  end

  # Dashboards
  get '/terapeuta/dashboard', to: 'terapeuta_dashboard#index', as: 'terapeuta_dashboard'
  get '/paciente/dashboard', to: 'paciente_dashboard#index', as: 'paciente_dashboard'

  # Rotas para completar perfis após cadastro
  get '/terapeuta/profile/new', to: 'terapeuta_profiles#new', as: 'new_terapeuta_profile'
  post '/terapeuta/profile', to: 'terapeuta_profiles#create', as: 'terapeuta_profiles'
  get '/paciente/profile/new', to: 'paciente_profiles#new', as: 'new_paciente_profile'
  post '/paciente/profile', to: 'paciente_profiles#create', as: 'paciente_profiles'

  # Rotas para deletar paciente
  get '/paciente/:id', to: 'terapeuta/pacientes#destroy', as: 'delete_paciente'

  # Namespaces organizados para futuras implementações
  namespace :terapeuta do
    resources :pacientes do
      resources :atendimentos
      resources :registros_clinicos
    end
    resources :atendimentos, only: [:index, :show, :edit, :update, :destroy, :new, :create]
    resources :registros_clinicos, only: [:index, :show, :edit, :update, :destroy, :new]
  end

  namespace :paciente do
    resources :atendimentos, only: [:index, :show]
    resources :registros_clinicos, only: [:index, :show]
  end

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Root
  root "home#index"
end
