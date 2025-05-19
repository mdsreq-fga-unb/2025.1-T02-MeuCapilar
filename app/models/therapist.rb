class Therapist < User
  # Relacionamentos
  has_many :patients
  has_many :sessions
  has_many :appointments
  
  # Métodos específicos
  def after_sign_in_path
    '/dashboard/therapist'
  end
end 