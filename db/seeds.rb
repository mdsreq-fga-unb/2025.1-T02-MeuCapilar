# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "🌱 Iniciando seeds..."

# Criar roles
puts "Criando roles..."
terapeuta_role = Role.find_or_create_by(name: 'terapeuta')
paciente_role = Role.find_or_create_by(name: 'paciente')

puts "✅ Roles criadas: #{Role.count}"

# Criar usuário terapeuta admin
puts "Criando terapeuta admin..."
admin_user = User.find_or_create_by(email: 'terapeuta@meucapilar.com') do |user|
  user.password = '123456'
  user.password_confirmation = '123456'
  user.user_type = 'terapeuta'
  user.status = true
end

if admin_user.persisted?
  admin_user.add_role(:terapeuta)
  
  admin_terapeuta = Terapeuta.find_or_create_by(user: admin_user) do |terapeuta|
    terapeuta.nome = 'Dr. José Silva'
    terapeuta.cpf = '12345678901'
    terapeuta.telefone = '11987654321'
    terapeuta.especialidade = 'Tricologia'
    terapeuta.status = true
  end
  
  puts "✅ Terapeuta admin criada: #{admin_terapeuta.nome}"
end

# Criar usuário paciente de exemplo
puts "Criando paciente de exemplo..."
paciente_user = User.find_or_create_by(email: 'paciente@meucapilar.com') do |user|
  user.password = '123456'
  user.password_confirmation = '123456'
  user.user_type = 'paciente'
  user.status = true
end

if paciente_user.persisted?
  paciente_user.add_role(:paciente)
  
  exemplo_paciente = Paciente.find_or_create_by(user: paciente_user) do |paciente|
    paciente.nome = 'João Santos'
    paciente.cpf = '98765432100'
    paciente.telefone = '61888888888'
    paciente.data_nascimento = 25.years.ago.to_date
    paciente.endereco = 'Rua das Flores, 123 - Brasília/DF'
    paciente.status = true
  end
  
  puts "✅ Paciente de exemplo criado: #{exemplo_paciente.nome}"
end

# Criar mais alguns pacientes para teste
puts "Criando pacientes adicionais..."
pacientes_data = [
  {
    email: 'ana@email.com',
    nome: 'Ana Costa',
    cpf: '11122233344',
    telefone: '61777777777',
    data_nascimento: 30.years.ago.to_date
  },
  {
    email: 'carlos@email.com',
    nome: 'Carlos Pereira',
    cpf: '55566677788',
    telefone: '61666666666',
    data_nascimento: 28.years.ago.to_date
  }
]

pacientes_data.each do |data|
  user = User.find_or_create_by(email: data[:email]) do |u|
    u.password = '123456'
    u.password_confirmation = '123456'
    u.user_type = 'paciente'
    u.status = true
  end
  
  if user.persisted?
    user.add_role(:paciente)
    
    Paciente.find_or_create_by(user: user) do |paciente|
      paciente.nome = data[:nome]
      paciente.cpf = data[:cpf]
      paciente.telefone = data[:telefone]
      paciente.data_nascimento = data[:data_nascimento]
      paciente.endereco = 'Brasília/DF'
      paciente.status = true
    end
  end
end

puts "✅ #{Paciente.count} pacientes criados no total"

# Criar alguns atendimentos de exemplo
if admin_terapeuta&.persisted? && Paciente.count > 0
  puts "Criando atendimentos de exemplo..."
  
  Paciente.limit(2).each do |paciente|
    # Atendimento passado
    Atendimento.find_or_create_by(
      paciente: paciente,
      terapeuta: admin_terapeuta,
      data: 1.week.ago,
      servico: 'Consulta inicial'
    ) do |atendimento|
      atendimento.status = 'realizado'
      atendimento.observacoes = 'Primeira consulta realizada com sucesso.'
    end
    
    # Atendimento futuro
    Atendimento.find_or_create_by(
      paciente: paciente,
      terapeuta: admin_terapeuta,
      data: 1.week.from_now,
      servico: 'Consulta de retorno'
    ) do |atendimento|
      atendimento.status = 'agendado'
      atendimento.observacoes = 'Consulta de acompanhamento.'
    end
  end
  
  puts "✅ #{Atendimento.count} atendimentos criados"
end

# Criar alguns registros clínicos de exemplo
if admin_terapeuta&.persisted? && Paciente.count > 0
  puts "Criando registros clínicos de exemplo..."
  
  Paciente.limit(2).each do |paciente|
    RegistroClinico.find_or_create_by(
      paciente: paciente,
      terapeuta: admin_terapeuta,
      data_registro: 1.week.ago
    ) do |registro|
      registro.diagnostico = 'Alopecia androgenética inicial. Paciente apresenta sinais de miniaturização folicular na região frontal.'
      registro.tratamento = 'Prescrição de minoxidil 5% e suplementação vitamínica.'
      registro.observacoes = 'Paciente orientado sobre cuidados diários e retorno em 30 dias.'
    end
  end
  
  puts "✅ #{RegistroClinico.count} registros clínicos criados"
end

puts "🎉 Seeds finalizados com sucesso!"
puts ""
puts "=== DADOS DE ACESSO ==="
puts "👩‍⚕️ TERAPEUTA:"
puts "   Email: terapeuta@meucapilar.com"
puts "   Senha: 123456"
puts ""
puts "👤 PACIENTE:"
puts "   Email: paciente@meucapilar.com"
puts "   Senha: 123456"
puts ""
puts "📊 RESUMO:"
puts "   - #{User.count} usuários"
puts "   - #{Terapeuta.count} terapeutas"
puts "   - #{Paciente.count} pacientes"
puts "   - #{Atendimento.count} atendimentos"
puts "   - #{RegistroClinico.count} registros clínicos"
puts "========================="
