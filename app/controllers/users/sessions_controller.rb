class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  def new
    # Preserva o user_type vindo da URL
    @user_type = params[:user_type]
    super
  end

  def create
    # Preserva o user_type durante o processo de login
    @user_type = params[:user_type] || params.dig(:user, :user_type)
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
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
end 