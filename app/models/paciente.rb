class Paciente < ApplicationRecord
  belongs_to :user
  accepts_nested_attributes_for :user, update_only: true
  
  # Associações
  has_many :atendimentos, dependent: :destroy
  has_many :terapeutas, through: :atendimentos
  has_many :registros_clinicos, class_name: 'RegistroClinico', dependent: :destroy

  # Validações
  validates :nome, presence: true, length: { minimum: 2 }, format: { with: /\A[a-zA-ZÀ-ÿ'\s]+\z/, message: "deve conter apenas letras" }
  validates :cpf, presence: true, uniqueness: true, cpf: true
  validates :telefone, presence: true, format: { with: /\A\d{10,11}\z/, message: "deve conter 10 ou 11 dígitos válidos (apenas números)" }
  validates :data_nascimento, presence: true
  validate :data_nascimento_valida

  # Scopes
  scope :ativos, -> { where(status: true) }
  scope :inativos, -> { where(status: false) }

  # Callbacks
  before_save :formatar_campos

  # Métodos
  def idade
    return 0 unless data_nascimento

    hoje = Date.current
    idade = hoje.year - data_nascimento.year
    idade -= 1 if hoje < data_nascimento + idade.years
    idade
  end

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

  def nome_curto
    nomes = nome.split(' ')
    return nome if nomes.length <= 2
    "#{nomes.first} #{nomes.last}"
  end

  def iniciais
    nome.split(' ').map(&:first).join('').upcase
  end

  def proximo_atendimento
    atendimentos.where('data >= ?', Date.current)
               .order(:data)
               .first
  end

  def ultimo_atendimento
    atendimentos.where('data < ?', Date.current)
               .order(data: :desc)
               .first
  end

  def total_atendimentos
    atendimentos.count
  end

  def atendimentos_realizados
    atendimentos.realizado.count
  end

  def ativo?
    status
  end

  def inativo?
    !status
  end

  private

  def data_nascimento_valida
    if data_nascimento.present?
      if data_nascimento > Date.current
        errors.add(:data_nascimento, "não pode ser no futuro")
      elsif data_nascimento < 120.years.ago
        errors.add(:data_nascimento, "não pode ser maior que 120 anos atrás")
      end
    end
  end

  def formatar_campos
    # Remove formatação do CPF para salvar apenas números
    self.cpf = cpf.gsub(/\D/, '') if cpf.present?
    
    # Remove formatação do telefone para salvar apenas números
    self.telefone = telefone.gsub(/\D/, '') if telefone.present?
    
    # Capitaliza nomes
    self.nome = nome.titleize if nome.present?
  end
end
