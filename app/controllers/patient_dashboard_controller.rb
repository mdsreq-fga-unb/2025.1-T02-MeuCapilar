class PatientDashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_patient
  
  def index
    # Informações para o dashboard do paciente
    @sessions = current_user.sessions.order(created_at: :desc).limit(5)
    @upcoming_appointments = current_user.appointments.where('date >= ?', Date.today).order(date: :asc).limit(5)
    @therapist = current_user.therapist
  end
  
  private
  
  def ensure_patient
    unless current_user.paciente?
      flash[:alert] = "Você não tem permissão para acessar esta área."
      redirect_to root_path
    end
  end
end 