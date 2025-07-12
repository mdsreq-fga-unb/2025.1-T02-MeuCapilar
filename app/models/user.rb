class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # Associações
  has_one :terapeuta, dependent: :destroy
  has_one :paciente, dependent: :destroy

  # Enums
  enum user_type: { terapeuta: 'terapeuta', paciente: 'paciente' }

  # Validações
  validates :user_type, presence: true

  # Métodos
  def profile
    case user_type
    when 'terapeuta'
      terapeuta
    when 'paciente'
      paciente
    end
  end

  def display_name
    profile&.nome || email
  end

  def terapeuta?
    has_role?(:terapeuta)
  end

  def paciente?
    has_role?(:paciente)
  end
end
