class Terapeuta::PacientesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_terapeuta
  load_and_authorize_resource :paciente, class: 'Paciente'

  def index
    # Buscar todos os pacientes do sistema (o terapeuta pode ver todos para agendar atendimentos)
    @pacientes = Paciente.includes(:user)
                        .order(created_at: :desc)
    
    # Aplicar filtro de busca se fornecido
    if params[:search].present?
      search_term = params[:search].strip
      
      # Se o termo de busca parece ser um CPF (contém números, pontos ou hífens),
      # também buscar pela versão sem formatação
      if search_term.match?(/[\d\.\-]/)
        cpf_clean = search_term.gsub(/\D/, '') # Remove tudo que não é dígito
        @pacientes = @pacientes.where(
          "pacientes.nome ILIKE ? OR pacientes.cpf ILIKE ? OR pacientes.cpf ILIKE ?", 
          "%#{search_term}%", 
          "%#{search_term}%",
          "%#{cpf_clean}%"
        )
      else
        @pacientes = @pacientes.where(
          "pacientes.nome ILIKE ? OR pacientes.cpf ILIKE ?", 
          "%#{search_term}%", 
          "%#{search_term}%"
        )
      end
    end
    
    @pacientes = @pacientes.page(params[:page]).per(10)
  end

  def show
    @paciente = current_user.terapeuta.pacientes.find(params[:id])
    @atendimentos = @paciente.atendimentos.includes(:terapeuta)
                             .order(data: :desc).limit(10)
    @registros_clinicos = @paciente.registros_clinicos.includes(:terapeuta)
                                   .order(data_registro: :desc).limit(5)
  end

  def new
    @paciente = Paciente.new
    @paciente.build_user
  end

  def create
    @paciente = Paciente.new(paciente_params)
    
    # Criar o usuário associado (sem senha definida, será criada na confirmação)
    user_params = params[:paciente][:user_attributes]
    temp_password = SecureRandom.hex(16) # Senha temporária única
    @user = User.new(
      email: user_params[:email],
      password: temp_password,
      password_confirmation: temp_password,
      user_type: 'paciente'
      # Removido status: true - conta ficará inativa até confirmação
    )

    if @user.save
      @user.add_role(:paciente)
      @paciente.user = @user
      
      if @paciente.save
        # Enviar e-mail de confirmação para o paciente definir senha
        @user.send_confirmation_instructions
        
        redirect_to terapeuta_paciente_path(@paciente), 
                    notice: 'Paciente cadastrado com sucesso! E-mail de confirmação enviado para que o paciente defina sua senha.'
      else
        @user.destroy # Limpar usuário se paciente não salvar
        render :new, status: :unprocessable_entity
      end
    else
      @paciente.valid? # Trigger validations for form display
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @paciente = Paciente.find(params[:id])
    @user = @paciente.user
  end

  def update
    @paciente = Paciente.find(params[:id])
    @user = @paciente.user

    # Extrair email do usuário dos parâmetros
    user_email = nil
    if params[:paciente][:user_attributes] && params[:paciente][:user_attributes][:email].present?
      user_email = params[:paciente][:user_attributes][:email]
      params[:paciente].delete(:user_attributes)
    end

    params[:paciente].delete(:cpf)

    Paciente.transaction do
      if @paciente.update(paciente_params)
        # Atualizar email do usuário se fornecido
        if user_email.present?
          @user.update_column(:email, user_email)
        end
        redirect_to terapeuta_pacientes_path, notice: 'Dados do paciente atualizados com sucesso.'
      else
        render :edit, status: :unprocessable_entity
      end
    end
  rescue ActiveRecord::RecordInvalid
    render :edit, status: :unprocessable_entity
  end

  def destroy
    @paciente = Paciente.find(params[:id])
    
    if @paciente.destroy
      redirect_to terapeuta_pacientes_path, 
                  notice: 'Paciente removido com sucesso.'
    else
      redirect_to terapeuta_paciente_path(@paciente),
                  alert: 'Não foi possível remover o paciente.'
    end
  end

  private

  def ensure_terapeuta
    unless current_user.terapeuta?
      redirect_to new_user_session_path, alert: 'Acesso restrito para terapeutas.'
    end
  end

  def paciente_params
    params.require(:paciente).permit(
      :nome, :cpf, :telefone, :data_nascimento, :endereco,
      :historico_familiar, :medicamentos_uso, :alergias, :observacoes
    )
  end

  def user_params
    params.dig(:paciente, :user_attributes) || params.dig(:paciente, :user) || {}
  end
end