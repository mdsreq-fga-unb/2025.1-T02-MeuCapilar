# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :store_user_type, only: [:new, :create]
  
  def new
    # Armazena o contexto na sessão se veio dos parâmetros
    if params[:user_type].present?
      session[:login_context] = params[:user_type]
    end
    super
  end

  def create
    # Primeiro tenta o comportamento padrão do Devise
    self.resource = warden.authenticate(auth_options)
    if resource
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      # Se há contexto de user_type, preserva na falha de autenticação
      if should_preserve_context?
        handle_authentication_failure
      else
        # Comportamento padrão do Devise para quando não há contexto
        super
      end
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def should_preserve_context?
    params[:user_type].present? || session[:login_context].present?
  end

  def store_user_type
    if params[:user_type].present?
      session[:login_context] = params[:user_type]
    end
  end

  def handle_authentication_failure
    # Cria um novo resource para o formulário com os dados enviados
    self.resource = resource_class.new(sign_in_params)
    
    # Define a mensagem baseada no motivo da falha
    case warden.message
    when :unconfirmed
      flash.now[:alert] = I18n.t('devise.failure.unconfirmed')
    when :locked
      flash.now[:alert] = I18n.t('devise.failure.locked')
    when :inactive
      flash.now[:alert] = I18n.t('devise.failure.inactive')
    when :invalid
      flash.now[:alert] = I18n.t('devise.failure.invalid')
    when :timeout
      flash.now[:alert] = I18n.t('devise.failure.timeout')
    else
      flash.now[:alert] = I18n.t('devise.failure.invalid')
    end

    # Renderiza a view new com o contexto preservado
    render :new, status: :unprocessable_entity
  end

  def after_sign_in_path_for(resource)
    # Limpa o contexto da sessão após login bem-sucedido
    session.delete(:login_context)
    
    if resource.has_role?(:terapeuta)
      terapeuta_dashboard_path
    elsif resource.has_role?(:paciente)
      paciente_dashboard_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    # Limpa a sessão ao fazer logout
    session.delete(:login_context)
    root_path
  end

  private

  def sign_in_params
    # Só requer user params se eles existirem (durante falha de autenticação)
    if params[:user].present?
      params.require(:user).permit(:email, :password, :remember_me)
    else
      {}
    end
  end

  def auth_options
    { scope: resource_name, recall: "#{controller_path}#new" }
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end 