class TherapistDashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_therapist
  
  def index
    # Apenas página simples
  end
  
  private
  
  def ensure_therapist
    unless current_user.terapeuta?
      flash[:alert] = "Você não tem permissão para acessar esta área."
      redirect_to root_path
    end
  end
end 