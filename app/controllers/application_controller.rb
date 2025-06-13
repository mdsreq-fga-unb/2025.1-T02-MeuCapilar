class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # CanCanCan
  check_authorization unless: :devise_controller?
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: 'Acesso negado. Você não tem permissão para acessar esta página.'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_type])
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_type])
    
    # Preserva o user_type durante login
    devise_parameter_sanitizer.permit(:sign_in, keys: [:user_type])
  end

  def after_sign_in_path_for(resource)
    case resource.user_type
    when 'terapeuta'
      terapeuta_dashboard_path
    when 'paciente'
      paciente_dashboard_path
    else
      root_path
    end
  end

  def after_sign_up_path_for(resource)
    case resource.user_type
    when 'terapeuta'
      # Redireciona para completar o perfil da terapeuta
      new_terapeuta_profile_path
    when 'paciente'
      # Redireciona para completar o perfil do paciente
      new_paciente_profile_path
    else
      root_path
    end
  end

  private

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end
end
