class PacienteDashboardController < ApplicationController
  before_action :ensure_paciente

  def index
    authorize! :read, :paciente_dashboard
    
    @paciente = current_user.paciente
    
    # Dados para o dashboard
    @proximo_atendimento = current_user.paciente&.atendimentos&.proximos&.first
    @atendimentos_agendados = current_user.paciente&.atendimentos&.proximos&.limit(3)&.order(:data) || []
    @historico_atendimentos = current_user.paciente&.atendimentos&.passados&.limit(5)&.order(data: :desc) || []
    @registros_clinicos = current_user.paciente&.registro_clinicos&.recentes&.limit(3) || []
  end

  private

  def ensure_paciente
    unless current_user&.has_role?(:paciente)
      redirect_to root_path, alert: 'Acesso restrito para pacientes.'
    end
  end
end
