class Paciente::RegistrosClinicosController < ApplicationController
  before_action :ensure_paciente
  before_action :set_registro_clinico, only: [:show, :export_pdf]
  
  def index
    Rails.logger.info "=== DEBUG: Acessando index de registros clínicos do paciente ==="
    Rails.logger.info "Current user: #{current_user&.id}"
    Rails.logger.info "User roles: #{current_user&.roles&.pluck(:name)}"
    Rails.logger.info "User paciente: #{current_user&.paciente&.id}"
    
    authorize! :read, RegistroClinico
    
    @paciente = current_user.paciente
    @registros_clinicos = @paciente.registros_clinicos
                                  .includes(:terapeuta, :atendimento)
                                  .order(data_registro: :desc)
                                  .limit(20)
  end
  
  def show
    authorize! :read, @registro_clinico
    
    @paciente = @registro_clinico.paciente
    @terapeuta = @registro_clinico.terapeuta
    @atendimento = @registro_clinico.atendimento
    
    # Outros registros do mesmo paciente (excluindo o atual)
    @outros_registros = @paciente.registros_clinicos
                                 .where.not(id: @registro_clinico.id)
                                 .order(data_registro: :desc)
                                 .limit(5)
  end
  
  def export_pdf
    authorize! :read, @registro_clinico
    
    begin
      pdf_service = RegistroClinicoPacientePdfService.new(@registro_clinico)
      pdf_content = pdf_service.generate.render
      
      # Nome do arquivo
      filename = "registro_clinico_#{@registro_clinico.id}_#{@registro_clinico.paciente.nome.parameterize}_#{@registro_clinico.data_registro.strftime('%Y%m%d')}.pdf"
      
      send_data pdf_content,
                filename: filename,
                type: 'application/pdf',
                disposition: 'attachment'
    rescue => e
      Rails.logger.error "Erro ao gerar PDF: #{e.message}"
      redirect_to paciente_registros_clinico_path(@registro_clinico), 
                  alert: 'Erro ao gerar o relatório PDF. Tente novamente.'
    end
  end
  
  private
  
  def ensure_paciente
    Rails.logger.info "=== DEBUG: Verificando se é paciente ==="
    Rails.logger.info "Current user: #{current_user&.id}"
    Rails.logger.info "User roles: #{current_user&.roles&.pluck(:name)}"
    Rails.logger.info "Has role paciente: #{current_user&.has_role?(:paciente)}"
    
    unless current_user&.has_role?(:paciente)
      Rails.logger.error "=== ERRO: Usuário não é paciente ==="
      redirect_to root_path, alert: 'Acesso restrito para pacientes.'
    end
  end
  
  def set_registro_clinico
    @registro_clinico = current_user.paciente.registros_clinicos.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to paciente_registros_clinicos_path, 
                alert: 'Registro clínico não encontrado.'
  end
end 