# Guia de Uso: Sistema de Login do MeuCapilar

Este documento fornece instruções detalhadas sobre como trabalhar com o sistema de autenticação e autorização implementado no projeto MeuCapilar.

## Estrutura do Sistema de Autenticação

O sistema utiliza a gem Devise para autenticação segura e a CanCanCan para autorização. Implementamos dois tipos de usuários usando Single Table Inheritance (STI):

1. **Terapeuta (Therapist)**: Profissional com acesso completo ao sistema
2. **Paciente (Patient)**: Cliente com acesso limitado às suas próprias informações

## Fluxo de Login

Implementamos um fluxo de login onde o usuário primeiro seleciona seu tipo (Terapeuta ou Paciente) e depois insere suas credenciais. Isso melhora a experiência do usuário e aumenta a segurança ao validar o tipo de usuário.

## Autenticação vs. Autorização

- **Autenticação**: Verifica se o usuário é quem diz ser (login/senha)
- **Autorização**: Determina o que um usuário autenticado pode fazer (permissões)

## Credenciais para Testes

Após executar o seed, você terá acesso a estas contas:

**Terapeuta:**
- Email: terapeuta@meucapilar.com
- Senha: password123

**Paciente:**
- Email: paciente@meucapilar.com
- Senha: password123

## Como Criar Novos Usuários

### Terapeutas

Atualmente, novos terapeutas devem ser criados via console:

```ruby
Therapist.create!(
  name: "Nome do Terapeuta",
  email: "email@exemplo.com",
  password: "senha123",
  specialty: "Especialidade",
  bio: "Biografia profissional"
)
```

### Pacientes

Pacientes são criados pelos terapeutas através da interface:

1. O terapeuta faz login e acessa "Novo Paciente"
2. Preenche os dados do paciente
3. Uma senha provisória é gerada
4. O paciente pode usar esta senha para acessar e alterá-la depois

## Verificação de Tipo de Usuário

Para verificar o tipo de usuário em controllers ou views:

```ruby
# Em controllers
if current_user.terapeuta?
  # Lógica específica para terapeutas
elsif current_user.paciente?
  # Lógica específica para pacientes
end

# Em views (usando helpers)
<% if terapeuta_signed_in? %>
  <!-- Conteúdo exclusivo para terapeutas -->
<% elsif paciente_signed_in? %>
  <!-- Conteúdo exclusivo para pacientes -->
<% end %>
```

## Redirecionamento Após Login

O sistema redireciona automaticamente para o dashboard correto após o login:

- Terapeutas → /dashboard/therapist
- Pacientes → /dashboard/patient

## Segurança

- As senhas são armazenadas usando algoritmo bcrypt (hash seguro)
- Validação de tipo de usuário durante o login
- Controle de acesso em todas as áreas restritas

## Problemas Conhecidos

- Não existe ainda um sistema de recuperação de senha funcional
- A criação de terapeutas só pode ser feita via console por enquanto
- As mensagens de erro precisam ser traduzidas e melhoradas

## Próximos Passos

- Implementar envio de email com senha provisória
- Criar área administrativa para gerenciar terapeutas
- Adicionar funcionalidade de recuperação de senha
- Melhorar proteção contra ataques de força bruta

## Dúvidas Frequentes

**P: O que fazer se um paciente esquecer a senha?**
R: Por enquanto, o terapeuta deve redefinir manualmente via console Rails.

**P: Como funciona a associação entre terapeuta e paciente?**
R: Um paciente pertence a um único terapeuta, enquanto um terapeuta pode ter vários pacientes.

**P: Os pacientes podem se cadastrar sozinhos?**
R: Não, apenas terapeutas podem cadastrar pacientes no sistema.

**P: A senha é segura?**
R: Sim, utilizamos bcrypt para hash de senhas, que é considerado muito seguro.

---

Para qualquer dúvida adicional, contate o responsável pelo desenvolvimento do sistema de autenticação. 