class TerapeutaProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_terapeuta_user
  before_action :redirect_if_profile_exists, only: [:new, :create]
  
  def new
    @terapeuta = Terapeuta.new
    authorize! :create, Terapeuta
  end

  def create
    @terapeuta = current_user.build_terapeuta(terapeuta_params)
    authorize! :create, @terapeuta
    
    if @terapeuta.save
      redirect_to terapeuta_dashboard_path, notice: 'Perfil de terapeuta criado com sucesso!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def ensure_terapeuta_user
    unless current_user.terapeuta?
      redirect_to root_path, alert: 'Acesso restrito a terapeutas.'
    end
  end

  def redirect_if_profile_exists
    if current_user.terapeuta.present?
      redirect_to terapeuta_dashboard_path, notice: 'Perfil já existe.'
    end
  end

  def terapeuta_params
    params.require(:terapeuta).permit(
      :nome, :cpf, :telefone, :especialidade, :status
    )
  end
end 