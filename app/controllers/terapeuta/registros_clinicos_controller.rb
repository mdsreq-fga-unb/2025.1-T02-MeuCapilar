require 'base64'
require 'tempfile'

class Terapeuta::RegistrosClinicosController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_terapeuta
  before_action :set_registro_clinico, only: [:show, :edit, :update, :destroy, :save_edited_image]
  load_and_authorize_resource :registro_clinico, class: 'RegistroClinico'

  def index
    @registros_clinicos = current_user.terapeuta.registros_clinicos
                                     .includes(:paciente, :atendimento)
                                     .order(data_registro: :desc)
    
    # Filtros
    if params[:paciente_id].present?
      @registros_clinicos = @registros_clinicos.where(paciente_id: params[:paciente_id])
    end
    
    if params[:tipo_registro].present?
      @registros_clinicos = @registros_clinicos.where(tipo_registro: params[:tipo_registro])
    end
    
    if params[:data_inicio].present? && params[:data_fim].present?
      @registros_clinicos = @registros_clinicos.por_periodo(
        Date.parse(params[:data_inicio]),
        Date.parse(params[:data_fim])
      )
    end
    
    @registros_clinicos = @registros_clinicos.page(params[:page]).per(15)
    
    # Dados para filtros
    @pacientes = current_user.terapeuta.pacientes.distinct.order(:nome)
    @tipos_registro = RegistroClinico.tipo_registros.keys.map { |k| [k.humanize, k] }
  end

  def show
    @paciente = @registro_clinico.paciente
    @atendimento = @registro_clinico.atendimento
    @outros_registros = @paciente.registros_clinicos
                                 .where.not(id: @registro_clinico.id)
                                 .where(terapeuta: current_user.terapeuta)
                                 .order(data_registro: :desc)
                                 .limit(5)
  end

  def new
    @registro_clinico = RegistroClinico.new
    @registro_clinico.terapeuta = current_user.terapeuta
    
    # Se vier de um atendimento específico
    if params[:atendimento_id].present?
      @atendimento = Atendimento.find(params[:atendimento_id])
      @registro_clinico.atendimento = @atendimento
      @registro_clinico.paciente = @atendimento.paciente
      @pacientes = [@atendimento.paciente]
    else
      @pacientes = current_user.terapeuta.pacientes.distinct.order(:nome)
    end
    
    @tipos_registro = RegistroClinico.tipo_registros.keys.map do |k|
      [RegistroClinico.new(tipo_registro: k).tipo_registro_humanizado, k]
    end
  end

  def create
    @registro_clinico = RegistroClinico.new(registro_clinico_params)
    @registro_clinico.terapeuta = current_user.terapeuta

    if @registro_clinico.save
      redirect_to terapeuta_registros_clinico_path(@registro_clinico),
                  notice: 'Registro clínico criado com sucesso!'
    else
      prepare_form_data
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @pacientes = current_user.terapeuta.pacientes.distinct.order(:nome)
    @tipos_registro = RegistroClinico.tipo_registros.keys.map do |k|
      [RegistroClinico.new(tipo_registro: k).tipo_registro_humanizado, k]
    end
  end

  def update
    # Pega todos os parâmetros permitidos
    all_params = registro_clinico_params
    
    # Separa os IDs das imagens a serem removidas do resto dos parâmetros
    purged_ids = all_params.delete(:purged_image_ids)
    
    # Remove as imagens marcadas, se houver
    if purged_ids.present?
      ids_to_purge = purged_ids.reject(&:blank?)
      images_to_purge = @registro_clinico.imagens.where(id: ids_to_purge)
      images_to_purge.each(&:purge_later)
    end

    # Atualiza o registro apenas com os atributos válidos do modelo
    if @registro_clinico.update(all_params)
      redirect_to terapeuta_registros_clinico_path(@registro_clinico),
                  notice: 'Registro clínico atualizado com sucesso!'
    else
      prepare_form_data
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @registro_clinico.destroy
    redirect_to terapeuta_registros_clinicos_path,
                notice: 'Registro clínico excluído com sucesso!'
  end

  def save_edited_image
    begin
      # Decodificar a imagem base64
      image_data = params[:image_data]
      image_index = params[:image_index].to_i
      
      # Remover o prefixo data:image/png;base64,
      image_data = image_data.split(',')[1] if image_data.include?(',')
      
      # Decodificar base64
      decoded_image = Base64.decode64(image_data)
      
      # Criar um arquivo temporário
      temp_file = Tempfile.new(['edited_image', '.png'])
      temp_file.binmode
      temp_file.write(decoded_image)
      temp_file.rewind
      
      # Criar um ActionDispatch::Http::UploadedFile
      uploaded_file = ActionDispatch::Http::UploadedFile.new(
        tempfile: temp_file,
        filename: "imagem_editada_#{Time.current.to_i}.png",
        type: 'image/png'
      )
      
      # Encontrar e substituir a imagem específica
      imagens_array = @registro_clinico.imagens.to_a
      if image_index > 0 && image_index <= imagens_array.length
        # Remover a imagem original (índice baseado em 1)
        imagem_original = imagens_array[image_index - 1]
        imagem_original.purge
        
        # Anexar a nova imagem editada
        @registro_clinico.imagens.attach(uploaded_file)
      else
        raise "Índice de imagem inválido"
      end
      
      temp_file.close
      temp_file.unlink
      
      render json: { 
        success: true, 
        message: 'Imagem editada substituída com sucesso!',
        total_images: @registro_clinico.imagens.count
      }
      
    rescue StandardError => e
      Rails.logger.error "Erro ao substituir imagem editada para o registro #{@registro_clinico.id}: #{e.message}\n#{e.backtrace.join("\n")}"
      render json: { 
        success: false, 
        message: "Ocorreu um erro inesperado ao salvar a imagem. A equipe de desenvolvimento foi notificada." 
      }, status: :unprocessable_entity
    end
  end

  private

  def set_registro_clinico
    @registro_clinico = current_user.terapeuta.registros_clinicos.find(params[:id])
  end

  def registro_clinico_params
    # Clona os parâmetros para poder modificá-los sem afetar o objeto original
    p = params.require(:registro_clinico).permit(
      :paciente_id, :atendimento_id, :tipo_registro,
      :queixa_principal, :diagnostico, :tratamento,
      :plano_terapeutico, :observacoes, :proxima_consulta,
      imagens: [],
      purged_image_ids: []
    )

    # Se o campo de imagens vier vazio (sem novos uploads), remova-o dos parâmetros
    # para evitar que o Active Storage apague todos os anexos existentes.
    if p[:imagens].is_a?(Array) && p[:imagens].reject(&:blank?).empty?
      p.delete(:imagens)
    end

    p
  end

  def prepare_form_data
    if @registro_clinico.atendimento_id.present?
      @atendimento = @registro_clinico.atendimento
      @pacientes = [@registro_clinico.paciente]
    else
      @pacientes = current_user.terapeuta.pacientes.distinct.order(:nome)
    end
    
    @tipos_registro = RegistroClinico.tipo_registros.keys.map do |k|
      [RegistroClinico.new(tipo_registro: k).tipo_registro_humanizado, k]
    end
  end

  def ensure_terapeuta
    unless current_user&.has_role?(:terapeuta)
      redirect_to root_path, alert: 'Acesso restrito para terapeutas.'
    end
  end
end 