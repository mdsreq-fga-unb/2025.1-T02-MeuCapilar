class TerapeutaDashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_terapeuta
  before_action :ensure_terapeuta_profile

  def index
    authorize! :read, :terapeuta_dashboard
    
    @terapeuta = current_user.terapeuta
    
    # Estatísticas gerais
    @total_pacientes = Paciente.count
    @total_registros = @terapeuta.registros_clinicos.count
    
    # Atendimentos
    hoje = Date.current
    @atendimentos_hoje = @terapeuta.atendimentos
                                   .where(data: hoje.beginning_of_day..hoje.end_of_day)
                                   .count
    
    @proximos_atendimentos = @terapeuta.atendimentos
                                       .where(data: hoje..(hoje + 7.days))
                                       .count
    
    # Listas para exibição
    @atendimentos_hoje_lista = @terapeuta.atendimentos
                                         .includes(:paciente)
                                         .where(data: hoje.beginning_of_day..hoje.end_of_day)
                                         .order(:data)
                                         .limit(5)
    
    @proximos_atendimentos_lista = @terapeuta.atendimentos
                                             .includes(:paciente)
                                             .where(data: (hoje + 1.day)..(hoje + 7.days))
                                             .order(:data)
                                             .limit(5)
  end

  private

  def ensure_terapeuta
    unless current_user.terapeuta?
      redirect_to root_path, alert: 'Acesso restrito a terapeutas.'
    end
  end

  def ensure_terapeuta_profile
    if current_user.terapeuta.nil?
      redirect_to new_terapeuta_profile_path, alert: 'Você precisa completar seu perfil antes de acessar o dashboard.'
    end
  end
end
