class Atendimento < ApplicationRecord
  belongs_to :paciente
  belongs_to :terapeuta

  # Enums
  enum status: { 
    agendado: 'agendado', 
    confirmado: 'confirmado', 
    realizado: 'realizado', 
    cancelado: 'cancelado' 
  }

  # Validações
  validates :data, :servico, :status, :duracao, presence: true
  validates :duracao, numericality: { greater_than: 0, less_than_or_equal_to: 480 } # Máximo 8 horas
  validate :data_futura_ou_presente
  validate :horario_comercial
  validate :verificar_disponibilidade

  # Scopes
  scope :por_data, ->(data) { where(data: data.beginning_of_day..data.end_of_day) }
  scope :proximos, -> { where('data >= ?', Time.current) }
  scope :passados, -> { where('data < ?', Time.current) }

  private

  def data_futura_ou_presente
    return unless data.present?
    
    if data < Time.current
      errors.add(:data, "não pode ser no passado")
    end
  end

  def horario_comercial
    return unless data.present?
    
    hora = data.hour
    if hora < 8 || hora > 18
      errors.add(:data, "deve estar entre 8h e 18h")
    end
  end

  def verificar_disponibilidade
    return unless data.present? && terapeuta_id.present? && duracao.present?
    
    # Calcular horário de fim do atendimento
    fim_atendimento = data + duracao.minutes
    
    # Verificar se há conflito com outros atendimentos
    atendimentos_existentes = Atendimento.where(terapeuta_id: terapeuta_id)
                                        .where.not(id: id) # Excluir o próprio registro se estiver editando
    
    conflito = atendimentos_existentes.any? do |atendimento|
      # Verificar se há sobreposição de horários
      fim_existente = atendimento.data + atendimento.duracao.minutes
      
      # Há conflito se:
      # 1. O início do novo atendimento está dentro de um atendimento existente
      # 2. O fim do novo atendimento está dentro de um atendimento existente  
      # 3. O novo atendimento engloba completamente um atendimento existente
      (data >= atendimento.data && data < fim_existente) ||
      (fim_atendimento > atendimento.data && fim_atendimento <= fim_existente) ||
      (data <= atendimento.data && fim_atendimento >= fim_existente)
    end
    
    if conflito
      errors.add(:data, "já possui atendimento agendado neste horário")
    end
  end
end
