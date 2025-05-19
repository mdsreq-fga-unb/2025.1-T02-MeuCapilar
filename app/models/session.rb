class Session < ApplicationRecord
  belongs_to :therapist
  belongs_to :patient
  
  validates :session_date, presence: true
  validates :therapist_id, presence: true
  validates :patient_id, presence: true
end 