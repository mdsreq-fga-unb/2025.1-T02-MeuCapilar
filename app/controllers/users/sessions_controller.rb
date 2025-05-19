class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    # Armazena o tipo de usuário (vindo da URL ou do formulário)
    session[:user_type] = params[:user_type] if params[:user_type].present?
    super
  end

  # POST /resource/sign_in
  def create
    # Verificando se o tipo de usuário corresponde ao e-mail
    # Obtém o tipo de usuário da sessão ou do parâmetro do formulário
    user_type = params[:user_type] || session[:user_type]
    session[:user_type] = user_type if user_type.present?
    
    email = params[:user][:email]
    user = User.find_by(email: email)
    
    if user.present? && user_type.present?
      # Verificação se o tipo de usuário está correto
      if (user_type == 'therapist' && !user.terapeuta?) || (user_type == 'patient' && !user.paciente?)
        flash[:alert] = "Usuário ou senha inválidos para o tipo selecionado."
        redirect_to new_user_session_path(user_type: user_type)
        return
      end
    end
    
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  # Se precisar de parâmetros personalizados
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
  end
end 