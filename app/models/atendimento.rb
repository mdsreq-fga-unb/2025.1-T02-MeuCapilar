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
  validates :data, :servico, :status, presence: true
  validates :data, uniqueness: { scope: :terapeuta_id, message: "já possui atendimento agendado neste horário" }
  validate :data_futura_ou_presente
  validate :horario_comercial

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
end
