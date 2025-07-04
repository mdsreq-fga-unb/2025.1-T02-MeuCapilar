class PacienteProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_paciente_user
  before_action :redirect_if_profile_exists, only: [:new, :create]
  
  def new
    @paciente = Paciente.new
    authorize! :create, Paciente
  end

  def create
    @paciente = current_user.build_paciente(paciente_params)
    authorize! :create, @paciente
    
    if @paciente.save
      redirect_to paciente_dashboard_path, notice: 'Perfil de paciente criado com sucesso!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def ensure_paciente_user
    unless current_user.paciente?
      redirect_to root_path, alert: 'Acesso restrito a pacientes.'
    end
  end

  def redirect_if_profile_exists
    if current_user.paciente.present?
      redirect_to paciente_dashboard_path, notice: 'Perfil já existe.'
    end
  end

  def paciente_params
    params.require(:paciente).permit(
      :nome, :cpf, :telefone, :data_nascimento, :endereco, :status
    )
  end
end 