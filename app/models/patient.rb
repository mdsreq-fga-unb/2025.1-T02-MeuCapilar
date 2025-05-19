class Patient < User
  # Relacionamentos
  belongs_to :therapist
  has_many :sessions
  has_many :appointments
  
  # Métodos específicos
  def after_sign_in_path
    '/dashboard/patient'
  end
end 