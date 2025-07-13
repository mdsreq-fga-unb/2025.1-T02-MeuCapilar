Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by uptime monitors, Kubernetes, etc.
  get "up" => "rails/health#show", as: :rails_health_check

  # Rotas do Devise com controllers customizados
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',
    registrations: 'users/registrations'
  }

  # Rotas específicas para login/cadastro por tipo de usuário dentro do devise_scope
  devise_scope :user do
    get '/terapeuta/login', to: 'users/sessions#new', defaults: { user_type: 'terapeuta' }, as: 'terapeuta_login'
    get '/terapeuta/cadastro', to: 'users/registrations#new', defaults: { user_type: 'terapeuta' }, as: 'terapeuta_cadastro'
    get '/paciente/login', to: 'users/sessions#new', defaults: { user_type: 'paciente' }, as: 'paciente_login'
    
    # Página de confirmação pendente
    get '/confirmacao-pendente', to: 'users/confirmations#pending', as: 'confirmation_pending'
    
    # Rota para confirmação com definição de senha (pacientes)
    post '/users/confirmation/confirm_with_password', to: 'users/confirmations#confirm_with_password', as: 'confirm_with_password_user_confirmation'
  end

  # Dashboards
  get '/terapeuta/dashboard', to: 'terapeuta_dashboard#index', as: 'terapeuta_dashboard'
  get '/paciente/dashboard', to: 'paciente_dashboard#index', as: 'paciente_dashboard'

  # Rotas para completar perfis após cadastro
  get '/terapeuta/profile/new', to: 'terapeuta_profiles#new', as: 'new_terapeuta_profile'
  post '/terapeuta/profile', to: 'terapeuta_profiles#create', as: 'terapeuta_profiles'
  get '/paciente/profile/new', to: 'paciente_profiles#new', as: 'new_paciente_profile'
  post '/paciente/profile', to: 'paciente_profiles#create', as: 'paciente_profiles'

  # Namespaces organizados para futuras implementações
  namespace :terapeuta do
    resources :pacientes do
      resources :atendimentos
      # A rota para registros_clinicos será definida no nível superior do namespace
    end
    resources :atendimentos, only: [:index, :show, :edit, :update, :destroy, :new, :create]
    resources :registros_clinicos do
      member do
        post :save_edited_image
        get :export_pdf
      end
    end
  end

  namespace :paciente do
    resources :registros_clinicos, only: [:index, :show] do
      member do
        get :export_pdf
      end
    end
  end

  # Rotas para deletar paciente (deixe por último!)
  get '/paciente/:id', to: 'terapeuta/pacientes#destroy', as: 'delete_paciente'

  # Root
  root "home#index"
end
