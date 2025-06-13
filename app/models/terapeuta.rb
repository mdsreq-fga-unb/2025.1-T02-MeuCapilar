class Terapeuta < ApplicationRecord
  belongs_to :user
  
  # Associações
  has_many :atendimentos, dependent: :destroy
  has_many :pacientes, through: :atendimentos
  has_many :registro_clinicos, dependent: :destroy

  # Validações
  validates :nome, :cpf, :telefone, :especialidade, presence: true
  validates :cpf, uniqueness: true, format: { with: /\A\d{11}\z/, message: "deve conter 11 dígitos" }
  validates :telefone, format: { with: /\A\d{10,11}\z/, message: "deve conter 10 ou 11 dígitos" }

  # Scopes
  scope :ativos, -> { where(status: true) }
  scope :inativos, -> { where(status: false) }

  # Callbacks
  before_save :format_cpf_and_telefone

  private

  def format_cpf_and_telefone
    self.cpf = cpf.gsub(/\D/, '') if cpf.present?
    self.telefone = telefone.gsub(/\D/, '') if telefone.present?
  end
end
