class Terapeuta::AtendimentosController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_terapeuta
  before_action :set_atendimento, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :atendimento, class: 'Atendimento'

  def index
    @atendimentos = current_user.terapeuta.atendimentos
                               .includes(:paciente)
                               .order(data: :desc)
                               .page(params[:page]).per(15)
  end

  def show
    @paciente = @atendimento.paciente
    @registros_clinicos = @paciente.registro_clinicos
                                   .where(terapeuta: current_user.terapeuta)
                                   .order(data_registro: :desc)
                                   .limit(5)
  end

  def new
    @atendimento = Atendimento.new
    @atendimento.terapeuta = current_user.terapeuta
    @pacientes = Paciente.order(:nome)
  end

  def create
    @atendimento = Atendimento.new(atendimento_params)
    @atendimento.terapeuta = current_user.terapeuta
    @pacientes = Paciente.order(:nome)

    # Combinar data e hora se fornecidos separadamente
    if params[:atendimento][:data].present? && params[:atendimento][:hora].present?
      begin
        data = Date.parse(params[:atendimento][:data])
        hora = Time.parse(params[:atendimento][:hora])
        @atendimento.data = DateTime.new(data.year, data.month, data.day, hora.hour, hora.min)
      rescue ArgumentError => e
        @atendimento.errors.add(:data, "formato de data ou hora inválido")
      end
    end

    if @atendimento.save
      redirect_to terapeuta_atendimento_path(@atendimento), 
                  notice: 'Atendimento agendado com sucesso!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @pacientes = Paciente.order(:nome)
  end

  def update
    # Combinar data e hora se fornecidos separadamente
    if params[:atendimento][:data].present? && params[:atendimento][:hora].present?
      begin
        data = Date.parse(params[:atendimento][:data])
        hora = Time.parse(params[:atendimento][:hora])
        params[:atendimento][:data] = DateTime.new(data.year, data.month, data.day, hora.hour, hora.min)
      rescue ArgumentError
        @atendimento.errors.add(:data, "formato de data ou hora inválido")
      end
    end

    if @atendimento.update(atendimento_params)
      redirect_to terapeuta_atendimento_path(@atendimento), 
                  notice: 'Atendimento atualizado com sucesso!'
    else
      @pacientes = Paciente.order(:nome)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @atendimento.destroy
    redirect_to terapeuta_atendimentos_path, 
                notice: 'Atendimento cancelado com sucesso!'
  end

  private

  def set_atendimento
    @atendimento = current_user.terapeuta.atendimentos.find(params[:id])
  end

  def atendimento_params
    params.require(:atendimento).permit(:paciente_id, :data, :servico, :status, :observacoes)
  end

  def ensure_terapeuta
    unless current_user&.has_role?(:terapeuta)
      redirect_to root_path, alert: 'Acesso restrito para terapeutas.'
    end
  end
end 