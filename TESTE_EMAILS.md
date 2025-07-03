# 📧 Guia de Teste de E-mails em Desenvolvimento

Este guia explica como testar todas as funcionalidades de e-mail do sistema MeuCapilar localmente.

## 🔧 Configuração Inicial

O sistema está configurado para salvar e-mails como arquivos em desenvolvimento (não envia e-mails reais).

### Localização dos E-mails
- **Diretório**: `tmp/mail/`
- **Formato**: Arquivos HTML com todo o conteúdo do e-mail

## 🚀 Comandos de Teste

### Preparação
```bash
# Configurar ambiente
sudo docker-compose exec web bundle exec rails email_test:setup

# Ver fluxo completo
sudo docker-compose exec web bundle exec rails email_test:flow

# Limpar dados antigos (opcional)
sudo docker-compose exec web bundle exec rails email_test:cleanup
```

### 1️⃣ Teste de Terapeuta

#### Cadastro e Confirmação
```bash
# Criar terapeuta
sudo docker-compose exec web bundle exec rails email_test:create_terapeuta

# Encontrar link de confirmação
sudo docker-compose exec web bundle exec rails email_test:find_confirmation_link

# Abrir o link no navegador para confirmar
```

#### Reset de Senha
```bash
# Solicitar reset
sudo docker-compose exec web bundle exec rails email_test:reset_password
# Digite o e-mail do terapeuta quando solicitado

# Encontrar link de reset
sudo docker-compose exec web bundle exec rails email_test:find_reset_link

# Abrir o link no navegador para redefinir senha
```

### 2️⃣ Teste de Paciente

#### Criação e Definição de Senha
```bash
# Criar paciente (precisa de terapeuta confirmado)
sudo docker-compose exec web bundle exec rails email_test:create_paciente

# Encontrar link de confirmação
sudo docker-compose exec web bundle exec rails email_test:find_confirmation_link

# Abrir o link - mostrará formulário para definir senha
```

#### Reset de Senha
```bash
# Solicitar reset
sudo docker-compose exec web bundle exec rails email_test:reset_password
# Digite o e-mail do paciente quando solicitado

# Encontrar link de reset
sudo docker-compose exec web bundle exec rails email_test:find_reset_link

# Abrir o link no navegador
```

### 3️⃣ Verificação
```bash
# Listar todos os usuários de teste
sudo docker-compose exec web bundle exec rails email_test:list_users
```

## 📧 Tipos de E-mail Testados

### 1. **Confirmação de Cadastro** (Terapeuta)
- **Quando**: Ao cadastrar nova terapeuta
- **Template**: `confirmation_instructions.html.erb`
- **Ação**: Link para confirmar e-mail

### 2. **Confirmação com Senha** (Paciente)
- **Quando**: Terapeuta cadastra novo paciente
- **Template**: `confirmation_instructions.html.erb`
- **Ação**: Link para definir senha inicial

### 3. **Reset de Senha** (Ambos)
- **Quando**: Usuário solicita "Esqueci minha senha"
- **Template**: `reset_password_instructions.html.erb`
- **Ação**: Link para redefinir senha

### 4. **Notificação de Alteração** (Automático)
- **Quando**: Senha é alterada
- **Template**: `password_change.html.erb`
- **Ação**: Apenas notificação

## 🔍 Como Encontrar Links

### Método Automático (Recomendado)
Use as tasks que extraem automaticamente:
- `rails email_test:find_confirmation_link`
- `rails email_test:find_reset_link`

### Método Manual
1. Abra `tmp/mail/`
2. Encontre o arquivo mais recente
3. Abra em navegador ou editor
4. Procure por links com:
   - `confirmation_token=`
   - `reset_password_token=`

## 🎯 Fluxo Completo de Teste

```bash
# 1. Preparação
sudo docker-compose exec web bundle exec rails email_test:setup

# 2. Terapeuta
sudo docker-compose exec web bundle exec rails email_test:create_terapeuta
sudo docker-compose exec web bundle exec rails email_test:find_confirmation_link
# Abrir link → Confirmar → Login

# 3. Reset Terapeuta
sudo docker-compose exec web bundle exec rails email_test:reset_password
sudo docker-compose exec web bundle exec rails email_test:find_reset_link
# Abrir link → Nova senha

# 4. Paciente
sudo docker-compose exec web bundle exec rails email_test:create_paciente
sudo docker-compose exec web bundle exec rails email_test:find_confirmation_link
# Abrir link → Definir senha → Login

# 5. Reset Paciente
sudo docker-compose exec web bundle exec rails email_test:reset_password
sudo docker-compose exec web bundle exec rails email_test:find_reset_link
# Abrir link → Nova senha

# 6. Verificação
sudo docker-compose exec web bundle exec rails email_test:list_users
```

## 🧹 Limpeza

```bash
# Remover todos os dados de teste
sudo docker-compose exec web bundle exec rails email_test:cleanup
```

## 💡 Dicas Importantes

1. **Servidor deve estar rodando**: `sudo docker-compose up`
2. **E-mails não são enviados**: Salvos apenas como arquivos
3. **Usuários de teste**: Todos têm e-mail com "@teste.com"
4. **Links são temporários**: Tokens expiram conforme configuração Devise
5. **Contexto preservado**: Links abrem na interface correta (terapeuta/paciente)

## 🚨 Solução de Problemas

### "Nenhum e-mail encontrado"
- Verifique se `tmp/mail/` existe
- Execute `rails email_test:setup`

### "Link não funciona"
- Verifique se servidor está rodando
- Token pode ter expirado
- Gere novo e-mail

### "Usuário não encontrado"
- Execute `rails email_test:list_users`
- Recrie com `rails email_test:create_*` 