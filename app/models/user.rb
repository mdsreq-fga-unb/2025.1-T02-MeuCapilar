class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  # Validações
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  
  # Tipo de usuário (STI - Single Table Inheritance)
  validates :type, presence: true, on: :create, if: :type_required?
  
  # Método para verificar se é terapeuta
  def terapeuta?
    type == 'Therapist'
  end
  
  # Método para verificar se é paciente
  def paciente?
    type == 'Patient'
  end
  
  private
  
  # O tipo só é obrigatório durante o registro, não no login
  def type_required?
    new_record? && !(respond_to?(:skip_type_validation) && skip_type_validation)
  end
end 