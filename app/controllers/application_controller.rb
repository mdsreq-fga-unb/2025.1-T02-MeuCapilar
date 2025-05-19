class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  # Configurando parâmetros permitidos para o Devise
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :type, :specialty, :bio, :date_of_birth, :medical_history])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :specialty, :bio, :date_of_birth, :medical_history])
  end
  
  # Customização do redirecionamento após login
  def after_sign_in_path_for(resource)
    if resource.terapeuta?
      therapist_dashboard_path
    elsif resource.paciente?
      patient_dashboard_path
    else
      root_path
    end
  end
  
  # Customização do redirecionamento após logout
  def after_sign_out_path_for(_resource)
    root_path
  end
end
