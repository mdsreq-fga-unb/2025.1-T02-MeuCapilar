class Terapeuta::PacientesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_terapeuta
  load_and_authorize_resource :paciente, class: 'Paciente'

  def index
    # Buscar todos os pacientes do sistema (o terapeuta pode ver todos para agendar atendimentos)
    @pacientes = Paciente.includes(:user)
                        .order(created_at: :desc)
                        .page(params[:page]).per(10)
  end

  def show
    @paciente = current_user.terapeuta.pacientes.find(params[:id])
    @atendimentos = @paciente.atendimentos.includes(:terapeuta)
                             .order(data: :desc).limit(10)
    @registros_clinicos = @paciente.registro_clinicos.includes(:terapeuta)
                                   .order(data_registro: :desc).limit(5)
    redirect_to terapeuta_paciente_path(@paciente)
  end

  def new
    @paciente = Paciente.new
    @paciente.build_user
  end

  def create
    @paciente = Paciente.new(paciente_params)
    
    # Criar o usuário associado
    user_params = params[:paciente][:user_attributes]
    @user = User.new(
      email: user_params[:email],
      password: user_params[:password],
      password_confirmation: user_params[:password_confirmation],
      user_type: 'paciente',
      status: true
    )

    if @user.save
      @user.add_role(:paciente)
      @paciente.user = @user
      
      if @paciente.save
        redirect_to terapeuta_paciente_path(@paciente), 
                    notice: 'Paciente cadastrado com sucesso! Credenciais de acesso criadas.'
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

    params[:paciente].delete(:cpf)
    if params[:paciente][:user_attributes]
      params[:paciente][:user_attributes].delete(:password)
      params[:paciente][:user_attributes].delete(:password_confirmation)
    end
    if params[:paciente][:user]
      params[:paciente][:user].delete(:password)
      params[:paciente][:user].delete(:password_confirmation)
    end

    Paciente.transaction do
      if @paciente.update(paciente_params)
        if user_params.present?
          @user.email = user_params[:email] if user_params[:email].present?
          @user.save!
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
      redirect_to root_path, alert: 'Acesso negado. Apenas terapeutas podem cadastrar pacientes.'
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