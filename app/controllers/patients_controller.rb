class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_therapist
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  
  def index
    @patients = current_user.patients
  end
  
  def show
    @sessions = @patient.sessions.order(created_at: :desc)
    @appointments = @patient.appointments.upcoming.limit(5)
  end
  
  def new
    @patient = Patient.new
  end
  
  def create
    @patient = Patient.new(patient_params)
    @patient.therapist = current_user
    
    # Gerar uma senha provisória para o paciente
    temp_password = SecureRandom.hex(8)
    @patient.password = temp_password
    
    if @patient.save
      # Aqui poderíamos enviar um e-mail com a senha provisória
      # UserMailer.welcome_email(@patient, temp_password).deliver_later
      
      redirect_to patient_path(@patient), notice: "Paciente cadastrado com sucesso. Senha provisória: #{temp_password}"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
  end
  
  def update
    if @patient.update(patient_params)
      redirect_to patient_path(@patient), notice: "Dados do paciente atualizados com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    if @patient.destroy
      redirect_to patients_path, notice: "Paciente removido com sucesso."
    else
      redirect_to patients_path, alert: "Não foi possível remover o paciente."
    end
  end
  
  private
  
  def ensure_therapist
    unless current_user.terapeuta?
      flash[:alert] = "Você não tem permissão para acessar esta área."
      redirect_to root_path
    end
  end
  
  def set_patient
    @patient = current_user.patients.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to patients_path, alert: "Paciente não encontrado."
  end
  
  def patient_params
    params.require(:patient).permit(:name, :email, :date_of_birth, :medical_history)
  end
end 