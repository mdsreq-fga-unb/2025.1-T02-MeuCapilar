class RegistroClinico < ApplicationRecord
  belongs_to :paciente
  belongs_to :terapeuta
  belongs_to :atendimento, optional: true

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

  # Scopes
  scope :por_paciente, ->(paciente_id) { where(paciente_id: paciente_id) }
  scope :por_terapeuta, ->(terapeuta_id) { where(terapeuta_id: terapeuta_id) }
  scope :por_periodo, ->(inicio, fim) { where(data_registro: inicio..fim) }
  scope :recentes, -> { order(data_registro: :desc) }
  scope :por_tipo, ->(tipo) { where(tipo_registro: tipo) }

  # Callbacks
  before_validation :set_data_registro, on: :create

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

  private

  def set_data_registro
    self.data_registro ||= Time.current
  end
end
