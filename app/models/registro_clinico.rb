class RegistroClinico < ApplicationRecord
  belongs_to :paciente
  belongs_to :terapeuta
  belongs_to :atendimento, optional: true

  # Active Storage - Imagens
  has_many_attached :imagens

  # Enums
  enum tipo_registro: {
    avaliacao_inicial: 'avaliacao_inicial',
    consulta_retorno: 'consulta_retorno',
    evolucao: 'evolucao',
    procedimento: 'procedimento',
    alta: 'alta',
    intercorrencia: 'intercorrencia'
  }

  # Validações
  validates :diagnostico, :data_registro, presence: true
  validates :diagnostico, length: { minimum: 10, message: "deve ter pelo menos 10 caracteres" }
  validates :tipo_registro, presence: true
  validates :queixa_principal, presence: true, length: { minimum: 5 }
  
  # Validações para imagens
  validate :limite_imagens

  # Scopes
  scope :por_paciente, ->(paciente_id) { where(paciente_id: paciente_id) }
  scope :por_terapeuta, ->(terapeuta_id) { where(terapeuta_id: terapeuta_id) }
  scope :por_periodo, ->(inicio, fim) { where(data_registro: inicio..fim) }
  scope :recentes, -> { order(data_registro: :desc) }
  scope :por_tipo, ->(tipo) { where(tipo_registro: tipo) }

  # Callbacks
  before_validation :set_data_registro, on: :create
  after_commit :convert_bmp_to_png, on: [:create, :update]

  # Métodos
  def tipo_registro_humanizado
    case tipo_registro
    when 'avaliacao_inicial'
      'Avaliação Inicial'
    when 'consulta_retorno'
      'Consulta de Retorno'
    when 'evolucao'
      'Evolução'
    when 'procedimento'
      'Procedimento'
    when 'alta'
      'Alta'
    when 'intercorrencia'
      'Intercorrência'
    else
      tipo_registro.humanize
    end
  end

  def data_formatada
    data_registro.strftime("%d/%m/%Y às %H:%M")
  end

  def resumo
    "#{tipo_registro_humanizado} - #{queixa_principal.truncate(50)}"
  end

  def tem_imagens?
    imagens.attached?
  end

  def total_imagens
    imagens.count
  end

  private

  def set_data_registro
    self.data_registro ||= Time.current
  end

  def limite_imagens
    return unless imagens.attached?
    
    # Validar número máximo de imagens
    if imagens.count > 10
      errors.add(:imagens, 'não pode ter mais de 10 imagens')
    end
    
    # Validar cada imagem individualmente
    imagens.each_with_index do |imagem, index|
      # Validar tipo de arquivo (BMP original ou PNG convertido)
      unless ['image/bmp', 'image/png'].include?(imagem.content_type)
        errors.add(:imagens, "imagem #{index + 1} deve ser um arquivo BMP ou PNG")
      end
      
      # Validar tamanho do arquivo
      if imagem.byte_size > 5.megabytes
        errors.add(:imagens, "imagem #{index + 1} deve ter menos de 5MB")
      end
    end
  end

  # TODO: Para uma maior escalabilidade e para não bloquear a requisição do usuário,
  #       considerar mover a lógica de conversão para um Active Job (background job).
  #       Isso evitaria timeouts em uploads de muitas imagens ou arquivos grandes.
  def convert_bmp_to_png
    return unless saved_change_to_attribute?(:id) || imagens.attached?
    
    # Evitar conversão dupla
    return if @converting_images
    @converting_images = true
    
    bmp_attachments = imagens.select { |img| img.content_type == 'image/bmp' }
    return if bmp_attachments.empty?
    
    Rails.logger.debug "Iniciando conversão de #{bmp_attachments.count} imagens BMP para PNG para o Registro ##{self.id}"
    
    bmp_attachments.each do |imagem|
      begin
        Rails.logger.debug "Convertendo: #{imagem.filename}"
        
        # Usar image_processing com variant para conversão
        variant = imagem.variant(format: :png)
        variant.processed
        
        # Baixar dados e criar StringIO para ser rewindable
        blob_data = variant.image.blob.download
        string_io = StringIO.new(blob_data)
        string_io.rewind
        
        # Criar novo attachment PNG
        new_filename = imagem.filename.to_s.gsub(/\.bmp$/i, '.png')
        
        # Anexar o variant como nova imagem PNG
        imagens.attach(
          io: string_io,
          filename: new_filename,
          content_type: 'image/png'
        )
        
        # Remover imagem BMP original
        imagem.purge
        
        Rails.logger.debug "Conversão concluída: #{new_filename}"
        
      rescue => e
        Rails.logger.error "Erro ao converter #{imagem.filename} para o Registro ##{self.id}: #{e.message}"
        Rails.logger.error e.backtrace.join("\n")
      end
    end
    
    @converting_images = false
    Rails.logger.debug "Conversão BMP->PNG finalizada para o Registro ##{self.id}"
  rescue => e
    @converting_images = false
    Rails.logger.error "Erro geral na conversão para o Registro ##{self.id}: #{e.message}"
  end
end
