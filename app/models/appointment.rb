class Appointment < ApplicationRecord
  belongs_to :therapist
  belongs_to :patient
  
  validates :date, presence: true
  validates :therapist_id, presence: true
  validates :patient_id, presence: true
  validates :status, presence: true, inclusion: { in: ['agendado', 'confirmado', 'cancelado', 'realizado'] }
  
  scope :upcoming, -> { where('date >= ?', Date.today).order(date: :asc) }
  scope :past, -> { where('date < ?', Date.today).order(date: :desc) }
end 