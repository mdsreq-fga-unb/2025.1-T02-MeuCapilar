require "test_helper"

class AtendimentoTest < ActiveSupport::TestCase
  def setup
    # Criar usuário terapeuta
    @terapeuta_user = User.create!(
      email: "terapeuta@test.com",
      password: "password123",
      user_type: "terapeuta"
    )
    
    @terapeuta = Terapeuta.create!(
      user: @terapeuta_user,
      nome: "Dr. João Silva",
      cpf: "11144477735",
      telefone: "11999999999",
      especialidade: "Tricologia"
    )

    # Criar usuário paciente
    @paciente_user = User.create!(
      email: "paciente@test.com",
      password: "password123",
      user_type: "paciente"
    )
    
    @paciente = Paciente.create!(
      user: @paciente_user,
      nome: "Maria Silva",
      cpf: "52998224725",
      telefone: "11888888888",
      data_nascimento: Date.new(1990, 5, 15)
    )

    # Criar atendimento válido
    @atendimento = Atendimento.new(
      paciente: @paciente,
      terapeuta: @terapeuta,
      data: 1.week.from_now.change(hour: 14, min: 0), # Data futura entre 8h e 18h
      servico: "Consulta Inicial",
      status: "agendado",
      duracao: 60,
      observacoes: "Primeira consulta"
    )
  end

  # Testes de criação válida
  test "deve criar atendimento válido" do
    assert @atendimento.valid?, "Atendimento deveria ser válido: #{@atendimento.errors.full_messages}"
    assert @atendimento.save, "Atendimento deveria ser salvo"
  end

  # Testes de validação obrigatórias
  test "deve exigir data" do
    @atendimento.data = nil
    assert_not @atendimento.valid?
    assert_includes @atendimento.errors[:data], "não pode ficar em branco"
  end

  test "deve exigir servico" do
    @atendimento.servico = nil
    assert_not @atendimento.valid?
    assert_includes @atendimento.errors[:servico], "não pode ficar em branco"
  end

  test "deve exigir status" do
    @atendimento.status = nil
    assert_not @atendimento.valid?
    assert_includes @atendimento.errors[:status], "não pode ficar em branco"
  end

  test "deve exigir duracao" do
    @atendimento.duracao = nil
    assert_not @atendimento.valid?
    assert_includes @atendimento.errors[:duracao], "não pode ficar em branco"
  end

  # Testes de validação de duração
  test "deve exigir duracao maior que zero" do
    @atendimento.duracao = 0
    assert_not @atendimento.valid?
    assert_includes @atendimento.errors[:duracao], "deve ser maior que 0"
  end

  test "deve exigir duracao menor ou igual a 480 minutos" do
    @atendimento.duracao = 481 # Mais de 8 horas
    assert_not @atendimento.valid?
    assert_includes @atendimento.errors[:duracao], "deve ser menor ou igual a 480"
  end

  test "deve aceitar duracao válida" do
    @atendimento.duracao = 60
    assert @atendimento.valid?
  end

  # Testes de validação de data
  test "deve rejeitar data no passado" do
    @atendimento.data = 1.hour.ago
    assert_not @atendimento.valid?
    assert_includes @atendimento.errors[:data], "não pode ser no passado"
  end

  test "deve aceitar data presente" do
    # Usar horário atual mas garantir que seja no horário comercial
    hora_atual = Time.current.hour
    if hora_atual < 8
      @atendimento.data = Time.current.change(hour: 8, min: 0)
    elsif hora_atual > 18
      @atendimento.data = 1.day.from_now.change(hour: 8, min: 0)
    else
      # Adicionar alguns minutos para garantir que seja futuro
      @atendimento.data = Time.current + 5.minutes
    end
    assert @atendimento.valid?
  end

  test "deve aceitar data futura" do
    @atendimento.data = 1.day.from_now.change(hour: 14, min: 0)
    assert @atendimento.valid?
  end

  # Testes de validação de horário comercial
  test "deve rejeitar horário antes das 8h" do
    @atendimento.data = 1.day.from_now.change(hour: 7, min: 30)
    assert_not @atendimento.valid?
    assert_includes @atendimento.errors[:data], "deve estar entre 8h e 18h"
  end

  test "deve rejeitar horário depois das 18h" do
    @atendimento.data = 1.day.from_now.change(hour: 19, min: 0)
    assert_not @atendimento.valid?
    assert_includes @atendimento.errors[:data], "deve estar entre 8h e 18h"
  end

  test "deve aceitar horário às 8h" do
    @atendimento.data = 1.day.from_now.change(hour: 8, min: 0)
    assert @atendimento.valid?
  end

  test "deve aceitar horário às 18h" do
    @atendimento.data = 1.day.from_now.change(hour: 18, min: 0)
    assert @atendimento.valid?
  end

  # Testes de validação de disponibilidade
  test "deve rejeitar atendimento com conflito de horário" do
    # Criar primeiro atendimento
    @atendimento.save!
    
    # Tentar criar segundo atendimento no mesmo horário
    atendimento_conflito = Atendimento.new(
      paciente: @paciente,
      terapeuta: @terapeuta,
      data: @atendimento.data, # Mesmo horário
      servico: "Consulta de Retorno",
      status: "agendado",
      duracao: 30
    )
    
    assert_not atendimento_conflito.valid?
    assert_includes atendimento_conflito.errors[:data], "já possui atendimento agendado neste horário"
  end

  test "deve rejeitar atendimento com sobreposição parcial" do
    # Criar primeiro atendimento (14h às 15h)
    @atendimento.save!
    
    # Tentar criar segundo atendimento que sobrepõe (14h30 às 15h30)
    atendimento_conflito = Atendimento.new(
      paciente: @paciente,
      terapeuta: @terapeuta,
      data: @atendimento.data + 30.minutes, # 30 minutos depois
      servico: "Consulta de Retorno",
      status: "agendado",
      duracao: 60
    )
    
    assert_not atendimento_conflito.valid?
    assert_includes atendimento_conflito.errors[:data], "já possui atendimento agendado neste horário"
  end

  test "deve aceitar atendimento em horário diferente" do
    # Criar primeiro atendimento
    @atendimento.save!
    
    # Criar segundo atendimento 2 horas depois
    atendimento_valido = Atendimento.new(
      paciente: @paciente,
      terapeuta: @terapeuta,
      data: @atendimento.data + 2.hours,
      servico: "Consulta de Retorno",
      status: "agendado",
      duracao: 60
    )
    
    assert atendimento_valido.valid?
  end

  test "deve aceitar atendimento com terapeuta diferente no mesmo horário" do
    # Criar segundo terapeuta
    terapeuta2_user = User.create!(
      email: "terapeuta2@test.com",
      password: "password123",
      user_type: "terapeuta"
    )
    
    terapeuta2 = Terapeuta.create!(
      user: terapeuta2_user,
      nome: "Dra. Ana Santos",
      cpf: "88641577947",
      telefone: "11888888888",
      especialidade: "Dermatologia"
    )

    # Criar primeiro atendimento
    @atendimento.save!
    
    # Criar segundo atendimento com terapeuta diferente no mesmo horário
    atendimento_valido = Atendimento.new(
      paciente: @paciente,
      terapeuta: terapeuta2,
      data: @atendimento.data, # Mesmo horário, mas terapeuta diferente
      servico: "Consulta de Retorno",
      status: "agendado",
      duracao: 60
    )
    
    assert atendimento_valido.valid?
  end

  # Testes de enum status
  test "deve aceitar status válidos" do
    %w[agendado confirmado realizado cancelado].each do |status|
      @atendimento.status = status
      assert @atendimento.valid?, "Status '#{status}' deveria ser válido"
    end
  end

  test "deve ter métodos de status" do
    @atendimento.status = "agendado"
    assert @atendimento.agendado?
    assert_not @atendimento.confirmado?
    assert_not @atendimento.realizado?
    assert_not @atendimento.cancelado?
  end

  # Testes de associações
  test "deve ter associação com paciente" do
    assert_respond_to @atendimento, :paciente
    assert_equal @paciente, @atendimento.paciente
  end

  test "deve ter associação com terapeuta" do
    assert_respond_to @atendimento, :terapeuta
    assert_equal @terapeuta, @atendimento.terapeuta
  end

  test "deve exigir paciente" do
    @atendimento.paciente = nil
    assert_not @atendimento.valid?
    assert_includes @atendimento.errors[:paciente], "é obrigatório(a)"
  end

  test "deve exigir terapeuta" do
    @atendimento.terapeuta = nil
    assert_not @atendimento.valid?
    assert_includes @atendimento.errors[:terapeuta], "é obrigatório(a)"
  end

  # Testes de scopes
  test "scope por_data deve filtrar por data" do
    @atendimento.save!
    
    # Criar atendimento em data diferente
    outro_atendimento = Atendimento.create!(
      paciente: @paciente,
      terapeuta: @terapeuta,
      data: 2.weeks.from_now.change(hour: 14, min: 0),
      servico: "Consulta de Retorno",
      status: "agendado",
      duracao: 60
    )
    
    data_busca = @atendimento.data.to_date
    atendimentos_do_dia = Atendimento.por_data(data_busca)
    
    assert_includes atendimentos_do_dia, @atendimento
    assert_not_includes atendimentos_do_dia, outro_atendimento
  end

  test "scope proximos deve filtrar atendimentos futuros" do
    @atendimento.save!
    
    # Criar atendimento no passado sem validação
    data_passada = 2.days.ago.change(hour: 14, min: 0)
    atendimento_passado = Atendimento.new(
      paciente: @paciente,
      terapeuta: @terapeuta,
      data: 1.day.from_now.change(hour: 14, min: 0), # Criar com data futura primeiro
      servico: "Consulta Passada",
      status: "realizado",
      duracao: 60
    )
    atendimento_passado.save!
    
    # Atualizar data diretamente no banco para contornar validação
    atendimento_passado.update_column(:data, data_passada)
    
    proximos = Atendimento.proximos
    
    assert_includes proximos, @atendimento
    assert_not_includes proximos, atendimento_passado
  end

  test "scope passados deve filtrar atendimentos passados" do
    @atendimento.save!
    
    # Criar atendimento no passado sem validação
    data_passada = 2.days.ago.change(hour: 14, min: 0)
    atendimento_passado = Atendimento.new(
      paciente: @paciente,
      terapeuta: @terapeuta,
      data: 1.day.from_now.change(hour: 14, min: 0), # Criar com data futura primeiro
      servico: "Consulta Passada",
      status: "realizado",
      duracao: 60
    )
    atendimento_passado.save!
    
    # Atualizar data diretamente no banco para contornar validação
    atendimento_passado.update_column(:data, data_passada)
    
    passados = Atendimento.passados
    
    assert_not_includes passados, @atendimento
    assert_includes passados, atendimento_passado
  end

  # Testes de validação ao editar
  test "deve permitir editar atendimento existente sem conflito consigo mesmo" do
    @atendimento.save!
    
    # Editar o mesmo atendimento não deve gerar conflito
    @atendimento.observacoes = "Observações atualizadas"
    assert @atendimento.valid?
  end

  # Testes com campos opcionais
  test "deve aceitar atendimento sem observacoes" do
    @atendimento.observacoes = nil
    assert @atendimento.valid?
  end

  test "deve aceitar observacoes vazias" do
    @atendimento.observacoes = ""
    assert @atendimento.valid?
  end

  # Testes de servicos válidos
  test "deve aceitar servicos comuns" do
    servicos = [
      "Consulta Inicial",
      "Consulta de Retorno", 
      "Avaliação Capilar",
      "Tratamento Capilar",
      "Acompanhamento",
      "Outro"
    ]
    
    servicos.each do |servico|
      @atendimento.servico = servico
      assert @atendimento.valid?, "Serviço '#{servico}' deveria ser válido"
    end
  end
end 