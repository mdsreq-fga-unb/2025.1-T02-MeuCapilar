# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Limpa os registros existentes
puts "Limpando registros existentes..."
Appointment.destroy_all
Session.destroy_all
Patient.destroy_all
Therapist.destroy_all

# Criando o terapeuta
puts "Criando terapeuta..."
terapeuta = Therapist.create!(
  name: "Maria Silva",
  email: "terapeuta@meucapilar.com",
  password: "password123",
  specialty: "Tricologista Capilar",
  bio: "Especialista em tratamentos capilares com mais de 10 anos de experiência."
)

# Criando um paciente associado ao terapeuta
puts "Criando paciente..."
paciente = Patient.create!(
  name: "João Santos",
  email: "paciente@meucapilar.com",
  password: "password123",
  date_of_birth: Date.new(1990, 5, 15),
  medical_history: "Histórico de queda capilar na família.",
  therapist: terapeuta
)

# Criando sessões passadas
puts "Criando sessões..."
2.times do |i|
  Session.create!(
    therapist: terapeuta,
    patient: paciente,
    session_date: (i+1).months.ago,
    notes: "Sessão de tratamento com aplicação de vitaminas capilares. Paciente relatou melhora na aparência do cabelo.",
    diagnosis: "Alopécia androgenética em estágio inicial.",
    value: 150.00,
    payment_status: "pago"
  )
end

# Criando agendamentos futuros
puts "Criando agendamentos..."
2.times do |i|
  Appointment.create!(
    therapist: terapeuta,
    patient: paciente,
    date: (i+1).weeks.from_now,
    status: "confirmado",
    comments: "Consulta de acompanhamento regular."
  )
end

puts "Seeds concluídos com sucesso!"
