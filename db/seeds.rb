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

# Criar usuário terapeuta admin já confirmado
puts "Criando terapeuta admin..."
admin_user = User.find_or_create_by(email: 'terapeuta@meucapilar.com') do |user|
  user.password = '123456'
  user.password_confirmation = '123456'
  user.user_type = 'terapeuta'
  user.status = true
  user.confirmed_at = Time.current # Confirma o email imediatamente
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
  
  puts "✅ Terapeuta admin criado: #{admin_terapeuta.nome}"
end

# Criar usuário paciente de exemplo já confirmado
puts "Criando paciente de exemplo..."
paciente_user = User.find_or_create_by(email: 'paciente@meucapilar.com') do |user|
  user.password = '123456'
  user.password_confirmation = '123456'
  user.user_type = 'paciente'
  user.status = true
  user.confirmed_at = Time.current # Confirma o email imediatamente
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
puts "========================="
