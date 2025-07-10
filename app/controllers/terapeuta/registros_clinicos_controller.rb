class Terapeuta::RegistrosClinicosController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_terapeuta
  before_action :set_registro_clinico, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :registro_clinico, class: 'RegistroClinico'

  def index
    @registros_clinicos = current_user.terapeuta.registros_clinicos
                                     .includes(:paciente, :atendimento)
                                     .order(data_registro: :desc)
    
    # Filtros
    if params[:paciente_id].present?
      @registros_clinicos = @registros_clinicos.where(paciente_id: params[:paciente_id])
    end
    
    if params[:tipo_registro].present?
      @registros_clinicos = @registros_clinicos.where(tipo_registro: params[:tipo_registro])
    end
    
    if params[:data_inicio].present? && params[:data_fim].present?
      @registros_clinicos = @registros_clinicos.por_periodo(
        Date.parse(params[:data_inicio]),
        Date.parse(params[:data_fim])
      )
    end
    
    @registros_clinicos = @registros_clinicos.page(params[:page]).per(15)
    
    # Dados para filtros
    @pacientes = current_user.terapeuta.pacientes.distinct.order(:nome)
    @tipos_registro = RegistroClinico.tipo_registros.keys.map { |k| [k.humanize, k] }
  end

  def show
    @paciente = @registro_clinico.paciente
    @atendimento = @registro_clinico.atendimento
    @outros_registros = @paciente.registros_clinicos
                                 .where.not(id: @registro_clinico.id)
                                 .where(terapeuta: current_user.terapeuta)
                                 .order(data_registro: :desc)
                                 .limit(5)
  end

  def new
    @registro_clinico = RegistroClinico.new
    @registro_clinico.terapeuta = current_user.terapeuta
    
    # Se vier de um atendimento específico
    if params[:atendimento_id].present?
      @atendimento = Atendimento.find(params[:atendimento_id])
      @registro_clinico.atendimento = @atendimento
      @registro_clinico.paciente = @atendimento.paciente
      @pacientes = [@atendimento.paciente]
    else
      @pacientes = current_user.terapeuta.pacientes.distinct.order(:nome)
    end
    
    @tipos_registro = RegistroClinico.tipo_registros.keys.map do |k|
      [RegistroClinico.new(tipo_registro: k).tipo_registro_humanizado, k]
    end
  end

  def create
    @registro_clinico = RegistroClinico.new(registro_clinico_params)
    @registro_clinico.terapeuta = current_user.terapeuta

    if @registro_clinico.save
      redirect_to terapeuta_registros_clinico_path(@registro_clinico),
                  notice: 'Registro clínico criado com sucesso!'
    else
      prepare_form_data
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @pacientes = current_user.terapeuta.pacientes.distinct.order(:nome)
    @tipos_registro = RegistroClinico.tipo_registros.keys.map do |k|
      [RegistroClinico.new(tipo_registro: k).tipo_registro_humanizado, k]
    end
  end

  def update
    if @registro_clinico.update(registro_clinico_params)
      redirect_to terapeuta_registros_clinico_path(@registro_clinico),
                  notice: 'Registro clínico atualizado com sucesso!'
    else
      prepare_form_data
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @registro_clinico.destroy
    redirect_to terapeuta_registros_clinicos_path,
                notice: 'Registro clínico excluído com sucesso!'
  end

  private

  def set_registro_clinico
    @registro_clinico = current_user.terapeuta.registros_clinicos.find(params[:id])
  end

  def registro_clinico_params
    params.require(:registro_clinico).permit(
      :paciente_id, :atendimento_id, :tipo_registro,
      :queixa_principal, :diagnostico, :tratamento,
      :plano_terapeutico, :observacoes, :proxima_consulta
    )
  end

  def prepare_form_data
    if @registro_clinico.atendimento_id.present?
      @atendimento = @registro_clinico.atendimento
      @pacientes = [@registro_clinico.paciente]
    else
      @pacientes = current_user.terapeuta.pacientes.distinct.order(:nome)
    end
    
    @tipos_registro = RegistroClinico.tipo_registros.keys.map do |k|
      [RegistroClinico.new(tipo_registro: k).tipo_registro_humanizado, k]
    end
  end

  def ensure_terapeuta
    unless current_user&.has_role?(:terapeuta)
      redirect_to root_path, alert: 'Acesso restrito para terapeutas.'
    end
  end
end 