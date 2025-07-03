# Configuração de E-mail para Confirmação

## ✨ Funcionalidade Implementada

Agora a aplicação **MeuCapilar** possui confirmação de e-mail obrigatória para novos terapeutas! 

### Como Funciona

1. **Cadastro**: Terapeuta se cadastra normalmente
2. **E-mail Enviado**: Sistema envia automaticamente um e-mail de confirmação
3. **Confirmação**: Usuário deve clicar no link do e-mail para ativar a conta
4. **Acesso Liberado**: Após confirmação, pode fazer login e completar o perfil

## 🔧 Configuração Necessária

Para que o envio de e-mails funcione em **desenvolvimento**, você precisa configurar as credenciais SMTP:

### 1. Configure as Variáveis de Ambiente

Crie um arquivo `.env` na raiz do projeto:

```bash
# Configurações de e-mail para desenvolvimento
GMAIL_USERNAME=seu_email@gmail.com
GMAIL_PASSWORD=sua_senha_de_aplicativo_aqui
```

### 2. Configuração do Gmail

Para usar Gmail SMTP, você precisa:

1. **Ativar Autenticação de 2 Fatores** na sua conta Google
2. **Gerar uma Senha de Aplicativo**:
   - Acesse: https://myaccount.google.com/security
   - Clique em "Senhas de app"
   - Selecione "App personalizado"
   - Digite "MeuCapilar" como nome
   - Use a senha gerada (16 caracteres) na variável `GMAIL_PASSWORD`

### 3. Configurações Alternativas

#### Usando MailCatcher (Desenvolvimento)

Se preferir não configurar SMTP real, pode usar MailCatcher:

```bash
gem install mailcatcher
mailcatcher
```

E alterar em `config/environments/development.rb`:

```ruby
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  address: 'localhost',
  port: 1025
}
```

#### Usando Letter Opener (Desenvolvimento)

Adicione no Gemfile:

```ruby
group :development do
  gem 'letter_opener'
end
```

E configure em `config/environments/development.rb`:

```ruby
config.action_mailer.delivery_method = :letter_opener
```

## 🚀 Produção

Para produção, configure as variáveis de ambiente no seu serviço de hospedagem com as credenciais do seu provedor de e-mail (Gmail, SendGrid, Mailgun, etc.).

## 🎨 Personalização

Os templates de e-mail estão em:
- `app/views/devise/mailer/confirmation_instructions.html.erb`
- `app/views/users/confirmations/pending.html.erb`
- `app/views/devise/confirmations/new.html.erb`

## 📱 Testando

1. Inicie o servidor: `rails server`
2. Acesse: http://localhost:3000/terapeuta/cadastro
3. Faça um cadastro com seu e-mail real
4. Verifique sua caixa de entrada
5. Clique no link de confirmação

## ⚙️ Configurações do Devise

As principais configurações estão em `config/initializers/devise.rb`:

- **E-mail do remetente**: `config.mailer_sender = 'noreply@meucapilar.com'`
- **Tempo de expiração**: `config.confirm_within = 3.days`
- **Reconfirmação**: `config.reconfirmable = true`

## 🔒 Segurança

- Links de confirmação expiram em 3 dias
- Tokens são únicos e seguros
- E-mail deve ser confirmado antes do primeiro login
- Suporte a reenvio de confirmação

---

🎯 **Pronto!** Agora sua aplicação tem um sistema robusto de confirmação de e-mail que garante que apenas usuários com e-mails válidos possam se cadastrar como terapeutas. 