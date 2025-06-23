class PacienteDashboardController < ApplicationController
  before_action :ensure_paciente
  before_action :ensure_paciente_profile

  def index
    authorize! :read, :paciente_dashboard
    
    @paciente = current_user.paciente
    
    # Dados para o dashboard
    @proximo_atendimento = current_user.paciente&.atendimentos&.proximos&.first
    @atendimentos_agendados = current_user.paciente&.atendimentos&.proximos&.limit(3)&.order(:data) || []
    @historico_atendimentos = current_user.paciente&.atendimentos&.passados&.limit(5)&.order(data: :desc) || []
    @registros_clinicos = current_user.paciente&.registros_clinicos&.recentes&.limit(3) || []
  end

  private

  def ensure_paciente
    unless current_user&.has_role?(:paciente)
      redirect_to root_path, alert: 'Acesso restrito para pacientes.'
    end
  end

  def ensure_paciente_profile
    if current_user.paciente.nil?
      redirect_to new_paciente_profile_path, alert: 'Você precisa completar seu perfil antes de acessar o dashboard.'
    end
  end
end
