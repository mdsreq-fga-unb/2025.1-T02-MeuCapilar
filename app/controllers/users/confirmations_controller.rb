class Users::ConfirmationsController < Devise::ConfirmationsController
  skip_before_action :authenticate_user!, only: [:pending]
  
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=token
  def show
    # Buscar usuário pelo token
    self.resource = resource_class.find_by_confirmation_token(params[:confirmation_token])
    
    if resource.nil?
      # Token inválido - redirecionar para página de erro
      redirect_to new_user_confirmation_path, alert: 'Token de confirmação inválido ou expirado.'
      return
    end

    # Se for paciente e ainda não confirmou, mostrar formulário para definir senha
    if resource.paciente? && !resource.confirmed?
      render :confirm_with_password
    else
      # Para terapeutas, confirmar e fazer login automático
      if resource.confirm
        # Garantir que a role seja atribuída na confirmação
        ensure_user_role(resource)
        
        # Login automático e redirect customizado
        sign_in(resource)
        redirect_to after_confirmation_path_for(resource_name, resource),
                    notice: 'E-mail confirmado com sucesso! Bem-vindo ao MeuCapilar.'
      else
        # Se houve erro na confirmação
        redirect_to terapeuta_login_path, alert: 'Erro ao confirmar e-mail. Tente novamente.'
      end
    end
  end

  # POST para confirmar com nova senha (apenas pacientes)
  def confirm_with_password
    self.resource = resource_class.find_by_confirmation_token(params[:confirmation_token])
    
    if resource.nil?
      redirect_to new_user_confirmation_path, alert: 'Token de confirmação inválido ou expirado.'
      return
    end

    # Verificar se as senhas coincidem
    if params[:user][:password] != params[:user][:password_confirmation]
      @error_message = 'As senhas não coincidem.'
      render :confirm_with_password
      return
    end

    # Verificar tamanho mínimo da senha
    if params[:user][:password].length < 6
      @error_message = 'A senha deve ter pelo menos 6 caracteres.'
      render :confirm_with_password
      return
    end

    # Atualizar senha e confirmar usuário
    if resource.update(
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation],
      confirmed_at: Time.current,
      confirmation_token: nil
    )
      # Garantir que a role seja atribuída na confirmação
      ensure_user_role(resource)
      
      # Login automático após confirmação
      sign_in(resource)
      redirect_to after_confirmation_path_for(resource_name, resource),
                  notice: 'E-mail confirmado e senha definida com sucesso! Bem-vindo ao MeuCapilar.'
    else
      @error_message = 'Erro ao definir senha. Tente novamente.'
      render :confirm_with_password
    end
  end

  # Página mostrada após cadastro informando que e-mail de confirmação foi enviado
  def pending
    # Não precisa autenticação para esta página
  end

  private

  # Garante que o usuário tenha a role apropriada após confirmação
  def ensure_user_role(user)
    case user.user_type
    when 'terapeuta'
      user.add_role(:terapeuta) unless user.has_role?(:terapeuta)
    when 'paciente'
      user.add_role(:paciente) unless user.has_role?(:paciente)
      # Ativar o paciente quando confirmar o e-mail
      if user.paciente.present? && !user.paciente.status
        user.paciente.update!(status: true)
      end
    end
  end

  protected

  # Redireciona após confirmação bem-sucedida
  def after_confirmation_path_for(resource_name, resource)
    case resource.user_type
    when 'terapeuta'
      if resource.terapeuta.present?
        terapeuta_dashboard_path
      else
        new_terapeuta_profile_path
      end
    when 'paciente'
      if resource.paciente.present?
        paciente_dashboard_path
      else
        new_paciente_profile_path
      end
    else
      root_path
    end
  end
  
  # Sobrescrever para redirecionar para login correto em caso de falha
  def after_resending_confirmation_instructions_path_for(resource_name)
    case resource&.user_type
    when 'terapeuta'
      terapeuta_login_path
    when 'paciente'
      paciente_login_path
    else
      new_user_session_path
    end
  end
end 