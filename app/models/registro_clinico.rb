class RegistroClinico < ApplicationRecord
  belongs_to :paciente
  belongs_to :terapeuta

  # Validações
  validates :diagnostico, :data_registro, presence: true
  validates :diagnostico, length: { minimum: 10, message: "deve ter pelo menos 10 caracteres" }

  # Scopes
  scope :por_paciente, ->(paciente_id) { where(paciente_id: paciente_id) }
  scope :por_terapeuta, ->(terapeuta_id) { where(terapeuta_id: terapeuta_id) }
  scope :por_periodo, ->(inicio, fim) { where(data_registro: inicio..fim) }
  scope :recentes, -> { order(data_registro: :desc) }

  # Callbacks
  before_validation :set_data_registro, on: :create

  private

  def set_data_registro
    self.data_registro ||= Time.current
  end
end
