class TerapeutaDashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_terapeuta

  def index
    @terapeuta = current_user.terapeuta
    
    # Estatísticas gerais
    @total_pacientes = @terapeuta.pacientes.count
    @total_registros = RegistroClinico.joins(:terapeuta).where(terapeutas: { user_id: current_user.id }).count
    
    # Atendimentos
    hoje = Date.current
    @atendimentos_hoje = Atendimento.joins(:terapeuta)
                                   .where(terapeutas: { user_id: current_user.id })
                                   .where(data: hoje)
                                   .count
    
    @proximos_atendimentos = Atendimento.joins(:terapeuta)
                                       .where(terapeutas: { user_id: current_user.id })
                                       .where(data: hoje..(hoje + 7.days))
                                       .count
    
    # Listas para exibição
    @atendimentos_hoje_lista = Atendimento.joins(:terapeuta)
                                         .includes(:paciente)
                                         .where(terapeutas: { user_id: current_user.id })
                                         .where(data: hoje)
                                         .order(:horario)
                                         .limit(5)
    
    @proximos_atendimentos_lista = Atendimento.joins(:terapeuta)
                                             .includes(:paciente)
                                             .where(terapeutas: { user_id: current_user.id })
                                             .where(data: (hoje + 1.day)..(hoje + 7.days))
                                             .order(:data, :horario)
                                             .limit(5)
  end

  private

  def ensure_terapeuta
    unless current_user.terapeuta?
      redirect_to root_path, alert: 'Acesso restrito a terapeutas.'
    end
  end
end
