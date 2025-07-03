require "test_helper"

class PacienteTest < ActiveSupport::TestCase
  def setup
    @user = User.create!(
      email: "teste@meucapilar.com",
      password: "password123",
      user_type: "paciente"
    )
    
    @paciente = Paciente.new(
      user: @user,
      nome: "João Silva",
      cpf: "11144477735", # CPF válido
      telefone: "11999999999",
      data_nascimento: Date.new(1990, 1, 1)
    )
  end

  # Testes de criação válida
  test "deve criar paciente válido" do
    assert @paciente.valid?, "Paciente deveria ser válido"
    assert @paciente.save, "Paciente deveria ser salvo"
  end

  # Testes de validação de nome
  test "deve exigir nome" do
    @paciente.nome = nil
    assert_not @paciente.valid?
    assert_includes @paciente.errors[:nome], "não pode ficar em branco"
  end

  test "deve exigir nome com pelo menos 2 caracteres" do
    @paciente.nome = "A"
    assert_not @paciente.valid?
    assert_includes @paciente.errors[:nome], "é muito curto (mínimo: 2 caracteres)"
  end

  test "deve aceitar nome válido" do
    @paciente.nome = "João Silva"
    assert @paciente.valid?
  end

  test "deve rejeitar nome com números" do
    @paciente.nome = "João123"
    assert_not @paciente.valid?
    assert_includes @paciente.errors[:nome], "deve conter apenas letras"
  end

  test "deve aceitar nome com acentos" do
    @paciente.nome = "José da Conceição"
    assert @paciente.valid?
  end

  # Testes de validação de CPF
  test "deve exigir CPF" do
    @paciente.cpf = nil
    assert_not @paciente.valid?
    assert_includes @paciente.errors[:cpf], "não pode ficar em branco"
  end

  test "deve exigir CPF único" do
    @paciente.save!
    
    outro_user = User.create!(
      email: "outro@meucapilar.com",
      password: "password123",
      user_type: "paciente"
    )
    
    paciente_duplicado = Paciente.new(
      user: outro_user,
      nome: "Maria Silva",
      cpf: "11144477735", # Mesmo CPF
      telefone: "11888888888",
      data_nascimento: Date.new(1985, 5, 10)
    )
    
    assert_not paciente_duplicado.valid?
    assert_includes paciente_duplicado.errors[:cpf], "já está em uso"
  end

  test "deve rejeitar CPF inválido" do
    @paciente.cpf = "12345678901" # CPF inválido
    assert_not @paciente.valid?
    assert_includes @paciente.errors[:cpf], "é inválido"
  end

  # Testes de validação de telefone
  test "deve exigir telefone" do
    @paciente.telefone = nil
    assert_not @paciente.valid?
    assert_includes @paciente.errors[:telefone], "não pode ficar em branco"
  end

  test "deve aceitar telefone com 10 dígitos" do
    @paciente.telefone = "1133334444"
    assert @paciente.valid?
  end

  test "deve aceitar telefone com 11 dígitos" do
    @paciente.telefone = "11999999999"
    assert @paciente.valid?
  end

  test "deve rejeitar telefone com menos de 10 dígitos" do
    @paciente.telefone = "123456789"
    assert_not @paciente.valid?
    assert_includes @paciente.errors[:telefone], "deve conter 10 ou 11 dígitos válidos (apenas números)"
  end

  test "deve rejeitar telefone com mais de 11 dígitos" do
    @paciente.telefone = "119999999999"
    assert_not @paciente.valid?
    assert_includes @paciente.errors[:telefone], "deve conter 10 ou 11 dígitos válidos (apenas números)"
  end

  # Testes de validação de data de nascimento
  test "deve exigir data de nascimento" do
    @paciente.data_nascimento = nil
    assert_not @paciente.valid?
    assert_includes @paciente.errors[:data_nascimento], "não pode ficar em branco"
  end

  test "deve rejeitar data de nascimento no futuro" do
    @paciente.data_nascimento = 1.day.from_now
    assert_not @paciente.valid?
    assert_includes @paciente.errors[:data_nascimento], "não pode ser no futuro"
  end

  test "deve rejeitar data de nascimento muito antiga" do
    @paciente.data_nascimento = 121.years.ago
    assert_not @paciente.valid?
    assert_includes @paciente.errors[:data_nascimento], "não pode ser maior que 120 anos atrás"
  end

  test "deve aceitar data de nascimento válida" do
    @paciente.data_nascimento = 30.years.ago
    assert @paciente.valid?
  end

  # Testes de métodos
  test "deve calcular idade corretamente" do
    @paciente.data_nascimento = 30.years.ago
    assert_equal 30, @paciente.idade
  end

  test "deve retornar 0 para idade quando data_nascimento é nil" do
    @paciente.data_nascimento = nil
    assert_equal 0, @paciente.idade
  end

  test "deve formatar CPF corretamente" do
    @paciente.cpf = "11144477735"
    assert_equal "111.444.777-35", @paciente.cpf_formatado
  end

  test "deve retornar CPF original se não tiver 11 dígitos" do
    @paciente.cpf = "123456"
    assert_equal "123456", @paciente.cpf_formatado
  end

  test "deve formatar telefone de 10 dígitos" do
    @paciente.telefone = "1133334444"
    assert_equal "(11) 3333-4444", @paciente.telefone_formatado
  end

  test "deve formatar telefone de 11 dígitos" do
    @paciente.telefone = "11999999999"
    assert_equal "(11) 99999-9999", @paciente.telefone_formatado
  end

  test "deve retornar nome curto corretamente" do
    @paciente.nome = "João da Silva Santos"
    assert_equal "João Santos", @paciente.nome_curto
  end

  test "deve retornar nome completo se tiver 2 palavras ou menos" do
    @paciente.nome = "João Silva"
    assert_equal "João Silva", @paciente.nome_curto
  end

  test "deve retornar iniciais corretamente" do
    @paciente.nome = "João da Silva"
    assert_equal "JDS", @paciente.iniciais
  end

  test "deve verificar se está ativo" do
    @paciente.status = true
    assert @paciente.ativo?
    assert_not @paciente.inativo?
  end

  test "deve verificar se está inativo" do
    @paciente.status = false
    assert_not @paciente.ativo?
    assert @paciente.inativo?
  end

  # Testes de callbacks
  test "deve formatar campos antes de salvar" do
    # Usar um paciente separado para este teste
    user = User.create!(
      email: "formato@test.com",
      password: "password123",
      user_type: "paciente"
    )
    
    paciente = Paciente.new(
      user: user,
      nome: "joão silva",
      cpf: "111.444.777-35",
      telefone: "11999999999", # Telefone já formatado corretamente
      data_nascimento: Date.new(1990, 1, 1)
    )
    
    paciente.save!
    
    assert_equal "11144477735", paciente.cpf
    assert_equal "11999999999", paciente.telefone
    assert_equal "João Silva", paciente.nome
  end

  # Testes de associações
  test "deve ter associação com user" do
    assert_respond_to @paciente, :user
    assert_equal @user, @paciente.user
  end

  test "deve ter associação com atendimentos" do
    assert_respond_to @paciente, :atendimentos
  end

  test "deve ter associação com registros clínicos" do
    assert_respond_to @paciente, :registros_clinicos
  end

  # Testes de scopes
  test "deve filtrar pacientes ativos" do
    @paciente.status = true
    @paciente.save!
    
    paciente_inativo = Paciente.create!(
      user: User.create!(email: "inativo@test.com", password: "password123", user_type: "paciente"),
      nome: "Maria Inativa",
      cpf: "52998224725", # CPF válido
      telefone: "11888888888",
      data_nascimento: 25.years.ago,
      status: false
    )
    
    assert_includes Paciente.ativos, @paciente
    assert_not_includes Paciente.ativos, paciente_inativo
  end

  test "deve filtrar pacientes inativos" do
    @paciente.status = false
    @paciente.save!
    
    paciente_ativo = Paciente.create!(
      user: User.create!(email: "ativo@test.com", password: "password123", user_type: "paciente"),
      nome: "Maria Ativa",
      cpf: "88641577947", # CPF válido diferente
      telefone: "11888888888",
      data_nascimento: 25.years.ago,
      status: true
    )
    
    assert_includes Paciente.inativos, @paciente
    assert_not_includes Paciente.inativos, paciente_ativo
  end
end
