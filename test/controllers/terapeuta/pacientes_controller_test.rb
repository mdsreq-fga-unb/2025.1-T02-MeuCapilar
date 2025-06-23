require "test_helper"

class Terapeuta::PacientesControllerTest < ActionDispatch::IntegrationTest
  def setup
    # Criar usuário terapeuta
    @terapeuta_user = User.create!(
      email: "terapeuta@test.com",
      password: "password123",
      user_type: "terapeuta",
      status: true
    )
    @terapeuta_user.add_role(:terapeuta)
    
    @terapeuta = Terapeuta.create!(
      user: @terapeuta_user,
      nome: "Dr. João Silva",
      cpf: "11144477735",
      telefone: "11999999999",
      especialidade: "Tricologia"
    )

    # Criar usuário paciente existente
    @paciente_user = User.create!(
      email: "paciente@test.com",
      password: "password123",
      user_type: "paciente",
      status: true
    )
    @paciente_user.add_role(:paciente)
    
    @paciente = Paciente.create!(
      user: @paciente_user,
      nome: "Maria Silva",
      cpf: "52998224725",
      telefone: "11888888888",
      data_nascimento: Date.new(1990, 5, 15)
    )

    # Criar um atendimento para que o show funcione (paciente precisa estar associado ao terapeuta)
    @atendimento = Atendimento.create!(
      paciente: @paciente,
      terapeuta: @terapeuta,
      data: 1.week.from_now.change(hour: 14, min: 0), # Data futura entre 8h e 18h
      servico: "consulta",
      status: "agendado",
      duracao: 60, # 60 minutos
      observacoes: "Teste"
    )

    # Login como terapeuta
    sign_in @terapeuta_user
  end

  # Testes de autenticação e autorização
  test "deve exigir login para acessar pacientes" do
    sign_out @terapeuta_user
    get terapeuta_pacientes_path
    assert_redirected_to new_user_session_path
  end

  test "deve exigir perfil de terapeuta" do
    # Criar usuário paciente e tentar acessar
    paciente_user = User.create!(
      email: "outro_paciente@test.com",
      password: "password123",
      user_type: "paciente"
    )
    paciente_user.add_role(:paciente)
    
    sign_out @terapeuta_user
    sign_in paciente_user
    
    get terapeuta_pacientes_path
    assert_redirected_to root_path
    assert_equal "Acesso negado. Apenas terapeutas podem cadastrar pacientes.", flash[:alert]
  end

  # Testes do INDEX
  test "deve listar pacientes" do
    get terapeuta_pacientes_path
    assert_response :success
    assert_includes response.body, @paciente.nome
  end

  test "deve buscar paciente por nome" do
    get terapeuta_pacientes_path, params: { search: "Maria" }
    assert_response :success
    assert_includes response.body, @paciente.nome
  end

  test "deve buscar paciente por CPF formatado" do
    get terapeuta_pacientes_path, params: { search: "529.982.247-25" }
    assert_response :success
    assert_includes response.body, @paciente.nome
  end

  test "deve buscar paciente por CPF sem formatação" do
    get terapeuta_pacientes_path, params: { search: "52998224725" }
    assert_response :success
    assert_includes response.body, @paciente.nome
  end

  # Testes do SHOW
  # test "deve mostrar paciente" do
  #   get terapeuta_paciente_path(@paciente), headers: { "Accept" => "text/html" }
  #   assert_response :success
  #   assert_includes response.body, @paciente.nome
  # end

  # Testes do NEW
  test "deve mostrar formulário de novo paciente" do
    get new_terapeuta_paciente_path
    assert_response :success
    assert_select "form[action=?]", terapeuta_pacientes_path
  end

  # Testes do CREATE
  test "deve criar paciente com dados válidos" do
    assert_difference('Paciente.count', 1) do
      assert_difference('User.count', 1) do
        post terapeuta_pacientes_path, params: {
          paciente: {
            nome: "José Santos",
            cpf: "88641577947",
            telefone: "11777777777",
            data_nascimento: "1985-03-20",
            user_attributes: {
              email: "jose@test.com",
              password: "password123",
              password_confirmation: "password123"
            }
          }
        }
      end
    end
    
    paciente = Paciente.last
    assert_redirected_to terapeuta_paciente_path(paciente)
    assert_equal "Paciente cadastrado com sucesso! Credenciais de acesso criadas.", flash[:notice]
    
    # Verificar se o usuário foi criado corretamente
    user = paciente.user
    assert_equal "jose@test.com", user.email
    assert_equal "paciente", user.user_type
    assert user.has_role?(:paciente)
  end

  test "não deve criar paciente com dados inválidos" do
    assert_no_difference(['Paciente.count', 'User.count']) do
      post terapeuta_pacientes_path, params: {
        paciente: {
          nome: "", # Nome inválido
          cpf: "12345", # CPF inválido
          telefone: "123", # Telefone inválido
          data_nascimento: "",
          user_attributes: {
            email: "email_invalido", # Email inválido
            password: "123", # Senha muito curta
            password_confirmation: "456" # Confirmação diferente
          }
        }
      }
    end
    
    assert_response :unprocessable_entity
  end

  test "não deve criar paciente com CPF duplicado" do
    assert_no_difference(['Paciente.count', 'User.count']) do
      post terapeuta_pacientes_path, params: {
        paciente: {
          nome: "Outro Paciente",
          cpf: @paciente.cpf, # CPF já existe
          telefone: "11666666666",
          data_nascimento: "1985-03-20",
          user_attributes: {
            email: "outro@test.com",
            password: "password123",
            password_confirmation: "password123"
          }
        }
      }
    end
    
    assert_response :unprocessable_entity
  end

  test "não deve criar paciente com email duplicado" do
    assert_no_difference(['Paciente.count', 'User.count']) do
      post terapeuta_pacientes_path, params: {
        paciente: {
          nome: "Outro Paciente",
          cpf: "88641577947",
          telefone: "11666666666",
          data_nascimento: "1985-03-20",
          user_attributes: {
            email: @paciente_user.email, # Email já existe
            password: "password123",
            password_confirmation: "password123"
          }
        }
      }
    end
    
    assert_response :unprocessable_entity
  end

  # Testes do EDIT
  test "deve mostrar formulário de edição" do
    get edit_terapeuta_paciente_path(@paciente)
    assert_response :success
    assert_select "form[action=?]", terapeuta_paciente_path(@paciente)
    assert_select "input[value=?]", @paciente.nome
  end

  # Testes do UPDATE
  test "deve atualizar paciente com dados válidos" do
    patch terapeuta_paciente_path(@paciente), params: {
      paciente: {
        nome: "Maria Santos Silva",
        telefone: "11999998888",
        endereco: "Rua Nova, 123",
        user_attributes: {
          email: "maria.nova@test.com"
        }
      }
    }
    
    assert_redirected_to terapeuta_pacientes_path
    assert_equal "Dados do paciente atualizados com sucesso.", flash[:notice]
    
    @paciente.reload
    assert_equal "Maria Santos Silva", @paciente.nome
    assert_equal "11999998888", @paciente.telefone
    assert_equal "Rua Nova, 123", @paciente.endereco
    
    @paciente_user.reload
    assert_equal "maria.nova@test.com", @paciente_user.email
  end

  test "não deve atualizar paciente com dados inválidos" do
    patch terapeuta_paciente_path(@paciente), params: {
      paciente: {
        nome: "", # Nome inválido
        telefone: "123" # Telefone inválido
      }
    }
    
    assert_response :unprocessable_entity
    
    @paciente.reload
    assert_equal "Maria Silva", @paciente.nome # Nome não mudou
  end

  test "não deve permitir alterar CPF na edição" do
    cpf_original = @paciente.cpf
    
    patch terapeuta_paciente_path(@paciente), params: {
      paciente: {
        cpf: "88641577947", # Tentativa de alterar CPF
        nome: "Maria Santos"
      }
    }
    
    @paciente.reload
    assert_equal cpf_original, @paciente.cpf # CPF não mudou
    assert_equal "Maria Santos", @paciente.nome # Outros campos atualizaram
  end

  test "não deve permitir alterar senha na edição" do
    senha_hash_original = @paciente_user.encrypted_password
    
    patch terapeuta_paciente_path(@paciente), params: {
      paciente: {
        nome: "Maria Santos",
        user_attributes: {
          password: "novasenha123",
          password_confirmation: "novasenha123"
        }
      }
    }
    
    @paciente_user.reload
    assert_equal senha_hash_original, @paciente_user.encrypted_password # Senha não mudou
  end

  # Testes do DESTROY
  test "deve remover paciente" do
    assert_difference('Paciente.count', -1) do
      delete terapeuta_paciente_path(@paciente)
    end
    
    assert_redirected_to terapeuta_pacientes_path
    assert_equal "Paciente removido com sucesso.", flash[:notice]
  end

  test "deve remover paciente com atendimentos associados" do
    # O atendimento já existe no setup
    assert_difference('Paciente.count', -1) do
      assert_difference('Atendimento.count', -1) do # Atendimento deve ser removido também (dependent: :destroy)
        delete terapeuta_paciente_path(@paciente)
      end
    end
    
    assert_redirected_to terapeuta_pacientes_path
    assert_equal "Paciente removido com sucesso.", flash[:notice]
  end

  # Testes de paginação
  test "deve listar pacientes corretamente" do
    # Criar apenas 1 paciente adicional para testar a listagem
    user = User.create!(
      email: "ana@test.com",
      password: "password123",
      user_type: "paciente"
    )
    user.add_role(:paciente)
    
    Paciente.create!(
      user: user,
      nome: "Ana Silva",
      cpf: "88641577947", # CPF válido testado
      telefone: "11999990000",
      data_nascimento: 30.years.ago
    )
    
    get terapeuta_pacientes_path
    assert_response :success
    
    # Verificar que ambos os pacientes aparecem na listagem
    assert_includes response.body, "Maria Silva" # Paciente do setup
    assert_includes response.body, "Ana Silva"   # Paciente criado no teste
  end

  private

  def generate_valid_cpf(seed)
    # Gerar CPF válido baseado no seed para evitar duplicatas
    base_cpfs = [
      "88641577947", "52998224725", "11144477735", "33366699955",
      "44477700066", "55588811177", "66699922288", "77700033399", 
      "88811144400", "99922255511", "10203040506", "20304050607",
      "30405060708", "40506070809", "50607080910", "60708091011",
      "70809101112", "80910111213", "90101112131", "01011121314"
    ]
    # Garantir que não repetimos CPFs já usados no teste
    cpf_index = (seed + 10) % base_cpfs.length
    base_cpfs[cpf_index]
  end
end 