namespace :email_test do
  desc "Criar script completo para testar funcionalidades de e-mail"
  task setup: :environment do
    puts "🚀 Configurando ambiente para teste de e-mails..."
    
    # Limpar diretório de e-mails
    mail_dir = Rails.root.join('tmp/mail')
    FileUtils.rm_rf(mail_dir) if Dir.exist?(mail_dir)
    FileUtils.mkdir_p(mail_dir)
    
    puts "✅ Diretório tmp/mail limpo e criado"
    puts "📧 E-mails serão salvos em: #{mail_dir}"
    puts ""
    puts "Use as tasks abaixo para testar:"
    puts "  rails email_test:create_terapeuta"
    puts "  rails email_test:find_confirmation_link"
    puts "  rails email_test:create_paciente"
    puts "  rails email_test:find_reset_link"
    puts "  rails email_test:list_users"
  end

  desc "Criar novo terapeuta para teste"
  task create_terapeuta: :environment do
    email = "terapeuta_teste_#{Time.current.to_i}@teste.com"
    password = "123456"
    
    puts "👩‍⚕️ Criando terapeuta de teste..."
    puts "E-mail: #{email}"
    puts "Senha: #{password}"
    
    user = User.new(
      email: email,
      password: password,
      password_confirmation: password,
      user_type: 'terapeuta'
    )
    
    if user.save
      user.add_role(:terapeuta)
      puts "✅ Terapeuta criado com sucesso!"
      puts "🆔 User ID: #{user.id}"
      puts "📧 E-mail de confirmação enviado para tmp/mail/"
      puts ""
      puts "Execute: rails email_test:find_confirmation_link"
    else
      puts "❌ Erro ao criar terapeuta:"
      user.errors.full_messages.each { |msg| puts "  - #{msg}" }
    end
  end

  desc "Criar novo paciente para teste"
  task create_paciente: :environment do
    # Buscar primeiro terapeuta confirmado
    terapeuta_user = User.joins(:roles).where(roles: { name: 'terapeuta' }).confirmed.first
    
    unless terapeuta_user&.terapeuta
      puts "❌ Nenhum terapeuta confirmado encontrado!"
      puts "Execute primeiro: rails email_test:create_terapeuta e confirme o e-mail"
      next
    end
    
    email = "paciente_teste_#{Time.current.to_i}@teste.com"
    
    puts "👤 Criando paciente de teste..."
    puts "E-mail: #{email}"
    puts "Terapeuta: #{terapeuta_user.email}"
    
    # Simular criação via controller de terapeuta
    temp_password = SecureRandom.hex(16)
    user = User.new(
      email: email,
      password: temp_password,
      password_confirmation: temp_password,
      user_type: 'paciente'
    )
    
    if user.save
      user.add_role(:paciente)
      
      # Criar perfil do paciente
      paciente = Paciente.create!(
        user: user,
        nome: "Paciente Teste #{Time.current.to_i}",
        cpf: "000.000.000-#{rand(10..99)}",
        telefone: "(11) 99999-9999",
        data_nascimento: 25.years.ago.to_date
      )
      
      # Enviar e-mail de confirmação
      user.send_confirmation_instructions
      
      puts "✅ Paciente criado com sucesso!"
      puts "🆔 User ID: #{user.id}"
      puts "👤 Paciente ID: #{paciente.id}"
      puts "📧 E-mail de confirmação enviado para tmp/mail/"
      puts ""
      puts "Execute: rails email_test:find_confirmation_link"
    else
      puts "❌ Erro ao criar paciente:"
      user.errors.full_messages.each { |msg| puts "  - #{msg}" }
    end
  end

  desc "Buscar link de confirmação no último e-mail"
  task find_confirmation_link: :environment do
    mail_dir = Rails.root.join('tmp/mail')
    
    unless Dir.exist?(mail_dir)
      puts "❌ Diretório tmp/mail não existe!"
      puts "Execute: rails email_test:setup"
      next
    end
    
    # Buscar último arquivo de e-mail
    mail_files = Dir.glob("#{mail_dir}/*").sort_by { |f| File.mtime(f) }
    
    if mail_files.empty?
      puts "❌ Nenhum e-mail encontrado em tmp/mail/"
      next
    end
    
    latest_mail = mail_files.last
    content = File.read(latest_mail)
    
    puts "📧 Último e-mail encontrado:"
    puts "Arquivo: #{File.basename(latest_mail)}"
    puts "Data: #{File.mtime(latest_mail)}"
    
    # Extrair link de confirmação
    if content.match(/confirmation_token=([^"&\s]+)/)
      token = $1
      confirmation_url = "http://localhost:3000/users/confirmation?confirmation_token=#{token}"
      
      puts ""
      puts "🔗 LINK DE CONFIRMAÇÃO ENCONTRADO:"
      puts confirmation_url
      puts ""
      puts "🖱️  Abra este link no navegador para confirmar a conta"
      
      # Verificar se é paciente para mostrar info especial
      user = User.find_by_confirmation_token(token)
      if user&.user_type == 'paciente'
        puts ""
        puts "🎯 PACIENTE: Este link abrirá o formulário para definir senha"
      end
    else
      puts "❌ Link de confirmação não encontrado no e-mail"
    end
    
    # Mostrar preview do e-mail
    puts ""
    puts "📄 Preview do e-mail:"
    puts "-" * 50
    puts content[0..500] + "..."
    puts "-" * 50
  end

  desc "Solicitar reset de senha para usuário"
  task reset_password: :environment do
    print "Digite o e-mail do usuário para reset: "
    email = STDIN.gets.chomp
    
    user = User.find_by(email: email)
    
    unless user
      puts "❌ Usuário não encontrado: #{email}"
      next
    end
    
    puts "🔄 Enviando e-mail de reset de senha para: #{email}"
    puts "Tipo: #{user.user_type.capitalize}"
    
    user.send_reset_password_instructions
    
    puts "✅ E-mail de reset enviado!"
    puts "📧 Verifique tmp/mail/ para o link"
    puts ""
    puts "Execute: rails email_test:find_reset_link"
  end

  desc "Buscar link de reset de senha no último e-mail"
  task find_reset_link: :environment do
    mail_dir = Rails.root.join('tmp/mail')
    
    unless Dir.exist?(mail_dir)
      puts "❌ Diretório tmp/mail não existe!"
      next
    end
    
    # Buscar último arquivo de e-mail
    mail_files = Dir.glob("#{mail_dir}/*").sort_by { |f| File.mtime(f) }
    
    if mail_files.empty?
      puts "❌ Nenhum e-mail encontrado em tmp/mail/"
      next
    end
    
    latest_mail = mail_files.last
    content = File.read(latest_mail)
    
    puts "📧 Último e-mail encontrado:"
    puts "Arquivo: #{File.basename(latest_mail)}"
    puts "Data: #{File.mtime(latest_mail)}"
    
    # Extrair link de reset
    if content.match(/reset_password_token=([^"&\s]+)/)
      token = $1
      reset_url = "http://localhost:3000/users/password/edit?reset_password_token=#{token}"
      
      puts ""
      puts "🔗 LINK DE RESET ENCONTRADO:"
      puts reset_url
      puts ""
      puts "🖱️  Abra este link no navegador para redefinir a senha"
    else
      puts "❌ Link de reset não encontrado no e-mail"
    end
    
    # Mostrar preview do e-mail
    puts ""
    puts "📄 Preview do e-mail:"
    puts "-" * 50
    puts content[0..500] + "..."
    puts "-" * 50
  end

  desc "Listar todos os usuários de teste"
  task list_users: :environment do
    puts "👥 Usuários de teste cadastrados:"
    puts ""
    
    test_users = User.where("email LIKE ?", "%teste%")
    
    if test_users.empty?
      puts "❌ Nenhum usuário de teste encontrado"
      next
    end
    
    test_users.each do |user|
      status = user.confirmed? ? "✅ Confirmado" : "⏳ Pendente"
      role = user.has_role?(:terapeuta) ? "👩‍⚕️ Terapeuta" : "👤 Paciente"
      
      puts "#{role} | #{status}"
      puts "  E-mail: #{user.email}"
      puts "  ID: #{user.id}"
      puts "  Criado: #{user.created_at.strftime('%d/%m/%Y %H:%M')}"
      
      if user.confirmation_token.present?
        puts "  Token: #{user.confirmation_token[0..8]}..."
      end
      
      puts ""
    end
  end

  desc "Limpar todos os dados de teste"
  task cleanup: :environment do
    puts "🧹 Limpando dados de teste..."
    
    # Remover usuários de teste
    test_users = User.where("email LIKE ?", "%teste%")
    count = test_users.count
    
    test_users.each do |user|
      user.paciente&.destroy
      user.terapeuta&.destroy
      user.destroy
    end
    
    # Limpar e-mails
    mail_dir = Rails.root.join('tmp/mail')
    FileUtils.rm_rf(mail_dir) if Dir.exist?(mail_dir)
    
    puts "✅ #{count} usuários removidos"
    puts "✅ E-mails limpos"
    puts "🎯 Ambiente pronto para novos testes"
  end

  desc "Mostrar fluxo completo de teste"
  task flow: :environment do
    puts <<~FLOW
    
    🎯 FLUXO COMPLETO DE TESTE DE E-MAILS
    =====================================
    
    1️⃣  PREPARAÇÃO:
        rails email_test:setup
        rails email_test:cleanup  # (opcional - limpar dados antigos)
    
    2️⃣  TESTE TERAPEUTA:
        rails email_test:create_terapeuta
        rails email_test:find_confirmation_link
        # Abra o link no navegador
        # Complete o perfil se necessário
    
    3️⃣  TESTE RESET TERAPEUTA:
        rails email_test:reset_password
        # Digite o e-mail do terapeuta
        rails email_test:find_reset_link
        # Abra o link no navegador
    
    4️⃣  TESTE PACIENTE:
        rails email_test:create_paciente
        rails email_test:find_confirmation_link
        # Abra o link no navegador
        # Defina uma senha nova no formulário
    
    5️⃣  TESTE RESET PACIENTE:
        rails email_test:reset_password
        # Digite o e-mail do paciente
        rails email_test:find_reset_link
        # Abra o link no navegador
    
    6️⃣  VERIFICAÇÃO:
        rails email_test:list_users
    
    💡 DICAS:
    - E-mails são salvos em tmp/mail/
    - Links são extraídos automaticamente
    - Use cleanup para limpar entre testes
    - Todos os usuários usam e-mails @teste.com
    
    FLOW
  end
end 