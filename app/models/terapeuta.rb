class Terapeuta < ApplicationRecord
  belongs_to :user
  
  # Associações
  has_many :atendimentos, dependent: :destroy
  has_many :pacientes, through: :atendimentos
  has_many :registro_clinicos, dependent: :destroy

  # Validações
  validates :nome, :cpf, :telefone, :especialidade, presence: true
  validates :cpf, uniqueness: true, cpf: true
  validates :telefone, format: { with: /\A\d{10,11}\z/, message: "deve conter 10 ou 11 dígitos" }

  # Scopes
  scope :ativos, -> { where(status: true) }
  scope :inativos, -> { where(status: false) }

  # Callbacks
  before_save :format_cpf_and_telefone

  # Métodos para formatação (similares ao modelo Paciente)
  def cpf_formatado
    return cpf unless cpf&.length == 11
    "#{cpf[0..2]}.#{cpf[3..5]}.#{cpf[6..8]}-#{cpf[9..10]}"
  end

  def telefone_formatado
    return telefone unless telefone
    # Remove todos os caracteres não numéricos
    numero = telefone.gsub(/\D/, '')
    
    case numero.length
    when 10
      # Telefone fixo: (xx) xxxx-xxxx
      "(#{numero[0..1]}) #{numero[2..5]}-#{numero[6..9]}"
    when 11
      # Celular: (xx) xxxxx-xxxx
      "(#{numero[0..1]}) #{numero[2..6]}-#{numero[7..10]}"
    else
      telefone
    end
  end

  private

  def format_cpf_and_telefone
    # Remove formatação do CPF para salvar apenas números
    self.cpf = cpf.gsub(/\D/, '') if cpf.present?
    
    # Remove formatação do telefone para salvar apenas números
    self.telefone = telefone.gsub(/\D/, '') if telefone.present?
    
    # Capitaliza nomes
    self.nome = nome.titleize if nome.present?
  end
end
