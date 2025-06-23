class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new
    # Força o user_type como terapeuta para cadastros via web
    @user_type = 'terapeuta'
    super
  end

  def create
    # Força o user_type como terapeuta para cadastros via web
    params[:user][:user_type] = 'terapeuta'
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_type])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_type])
  end

  def after_sign_up_path_for(resource)
    case resource.user_type
    when 'terapeuta'
      resource.add_role(:terapeuta) unless resource.has_role?(:terapeuta)
      new_terapeuta_profile_path
    when 'paciente'
      resource.add_role(:paciente) unless resource.has_role?(:paciente)
      new_paciente_profile_path
    else
      root_path
    end
  end
end 