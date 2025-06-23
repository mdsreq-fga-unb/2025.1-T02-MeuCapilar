# 2025.1-T02-MeuCapilar

## Quem Somos?
Somos um grupo da disciplina de Requisitos de Software, oferecida pela Universidade de Brasília e ministrada pelo Professor Dr. George Marsicano. A disciplina tem como foco principal a compreensão detalhada das necessidades de um sistema de software, buscando garantir que todos os envolvidos no projeto compartilhem uma visão clara e alinhada desde as etapas iniciais do desenvolvimento.

## Mais informações 

Para acessar a nossa documentação [clique aqui](https://mdsreq-fga-unb.github.io/2025.1-T02-MeuCapilar/).

## Equipe

<center>
<table>
  <tr>
    <td align="center">
      <a href="https://github.com/PedroALuciano">
        <img src="https://github.com/PedroALuciano.png" width="190" style="border-radius: 50%;" alt="Pedro Luciano"/>
        <br/><sub><b>Pedro Luciano - 212005453</b></sub>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/caua08">
        <img src="https://github.com/caua08.png" width="190" style="border-radius: 50%;" alt="Cauã Araujo"/>
        <br/><sub><b>Cauã Araujo - 221022490</b></sub>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/joseandre25">
        <img src="https://github.com/joseandre25.png" width="190" style="border-radius: 50%;" alt="José Rabelo"/>
        <br/><sub><b>José Rabelo - 211062016</b></sub>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/miguelpiresgomes25">
        <img src="https://github.com/miguelpiresgomes25.png" width="190" style="border-radius: 50%;" alt="Miguel Pires"/>
        <br/><sub><b>Miguel Pires - 222007030</b></sub>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/devwallyson">
        <img src="https://github.com/devwallyson.png" width="190" style="border-radius: 50%;" alt="Wallyson Souza"/>
        <br/><sub><b>Wallyson Souza - 222006196</b></sub>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/iancostag">
        <img src="https://github.com/iancostag.png" width="190" style="border-radius: 50%;" alt="Ian Costa"/>
        <br/><sub><b>Ian Costa - 222014859</b></sub>
      </a>
    </td>
  </tr>
</table>
</center>

---

# MeuCapilar - Ambiente de Desenvolvimento

Este README fornece as instruções completas para configurar o ambiente de desenvolvimento deste projeto Rails utilizando Docker e Docker Compose, além das boas práticas de desenvolvimento da equipe.

## 🔧 Pré-requisitos

Antes de começar, certifique-se de que as seguintes ferramentas estejam instaladas em sua máquina:

* **Docker:** [Instruções de instalação do Docker](https://docs.docker.com/engine/install/)
* **Docker Compose:** [Instruções de instalação do Docker Compose](https://docs.docker.com/compose/install/)
* **Git:** Para clonar o repositório

## 🚀 Configuração Inicial (Primeira vez)

### 1. Clonar o Repositório

```bash
git clone https://github.com/mdsreq-fga-unb/2025.1-T02-MeuCapilar.git
```

### 1.1. Acessar o Diretório

```bash
cd 2025.1-T02-MeuCapilar
```

### 2. Configurar Variáveis de Ambiente

Crie o arquivo `.env` na raiz do projeto com as seguintes configurações:

```bash
# Criar arquivo .env
cat > .env << EOF
DB_USERNAME=postgres
DB_PASSWORD=postgres
EOF
```

> **Nota:** O arquivo `.env.example` não está versionado por questões de segurança. Use as configurações acima para desenvolvimento local.

### 3. Primeira Execução

Execute a sequência completa de comandos para configurar o ambiente:

```bash
# Limpar ambiente Docker (caso necessário)
docker container prune -f
docker image prune -a -f
docker volume prune -f
docker builder prune -f

# Construir e subir os containers
docker-compose build --no-cache
docker-compose up -d

# Configurar banco de dados
docker-compose exec web bin/rails db:setup

# Compilar CSS do Tailwind
docker-compose exec web bin/rails tailwindcss:build
```

### 4. Acessar a Aplicação

Após a configuração, a aplicação estará disponível em:
```
http://localhost:3000
```

## 🔄 Desenvolvimento - Mudança de Branch

**⚠️ IMPORTANTE:** Sempre que trocar de branch ou fazer pull de mudanças significativas, execute a sequência completa abaixo para evitar problemas:

```bash
# 1. Limpar completamente o ambiente Docker
docker container prune -f
docker image prune -a -f  
docker volume prune -f
docker builder prune -f

# 2. Reconstruir containers sem cache
docker-compose build --no-cache

# 3. Subir os serviços
docker-compose up -d

# 4. Reconfigurar banco de dados
docker-compose exec web bin/rails db:setup

# 5. Recompilar CSS
docker-compose exec web bin/rails tailwindcss:build
```

> **Por que essa sequência?** Durante o desenvolvimento com Docker, mudanças no código, dependências ou banco podem causar inconsistências. Essa sequência garante um ambiente limpo e atualizado.

## 🧪 Executando Testes

O projeto possui uma suite completa de testes unitários para os modelos e controllers.

### Executar Todos os Testes

```bash
# Todos os testes da aplicação
docker-compose exec web bin/rails test

# Testes com detalhamento
docker-compose exec web bin/rails test --verbose
```

### Executar Testes Específicos

```bash
# Testes de um modelo específico
docker-compose exec web bin/rails test test/models/paciente_test.rb
docker-compose exec web bin/rails test test/models/atendimento_test.rb

# Testes de um controller específico  
docker-compose exec web bin/rails test test/controllers/terapeuta/pacientes_controller_test.rb
docker-compose exec web bin/rails test test/controllers/terapeuta/atendimentos_controller_test.rb

# Teste específico por nome
docker-compose exec web bin/rails test test/models/paciente_test.rb -n "test_deve_validar_cpf"
```

### Cobertura Atual de Testes

✅ **105 testes passando** com **297 assertions**

- **Modelo Paciente:** 35 testes (validações, métodos, associações)
- **Controller Pacientes:** 19 testes (CRUD completo, autorizações)
- **Modelo Atendimento:** 32 testes (validações complexas, conflitos de horário)
- **Controller Atendimentos:** 19 testes (CRUD, calendário, regras de negócio)

## 📝 Comandos Úteis para Desenvolvimento

### Console Rails
```bash
docker-compose exec web bin/rails console
```

### Executar Migrations
```bash
docker-compose exec web bin/rails db:migrate
```

### Resetar Banco de Dados
```bash
docker-compose exec web bin/rails db:reset
```

### Ver Logs
```bash
# Logs de todos os containers
docker-compose logs -f

# Logs apenas da aplicação web
docker-compose logs -f web

# Logs apenas do banco
docker-compose logs -f db
```

### Acessar Container
```bash
# Acessar bash do container web
docker-compose exec web bash

# Acessar bash do container do PostgreSQL
docker-compose exec db bash
```

## 🛠️ Estrutura do Projeto

```
├── app/
│   ├── controllers/     # Controllers da aplicação
│   ├── models/         # Modelos e validações
│   ├── views/          # Templates ERB
│   └── assets/         # CSS, JS, imagens
├── config/             # Configurações Rails
├── db/                 # Migrations e schema
├── test/               # Testes unitários
│   ├── models/         # Testes dos modelos
│   └── controllers/    # Testes dos controllers
├── docker-compose.yml  # Configuração Docker
├── Dockerfile         # Imagem da aplicação
└── .env              # Variáveis de ambiente (não versionado)
```

## 🐛 Solução de Problemas Comuns

### Container não sobe
```bash
# Verificar se há outros serviços na porta 3000
sudo netstat -tulpn | grep :3000

# Parar todos os containers
docker-compose down

# Limpar e reconstruir
docker system prune -a -f
docker-compose build --no-cache
```

### Erro de permissão
```bash
# No Linux, pode ser necessário sudo
sudo docker-compose exec web bin/rails db:setup
```

### Banco não conecta
```bash
# Verificar se o container do banco está rodando
docker-compose ps

# Recriar volume do banco
docker-compose down -v
docker-compose up -d
docker-compose exec web bin/rails db:setup
```

### CSS não carrega
```bash
# Recompilar Tailwind CSS
docker-compose exec web bin/rails tailwindcss:build
```

## 🎯 Boas Práticas da Equipe

1. **Sempre usar a sequência de mudança de branch** quando trocar de branch
2. **Executar testes** antes de fazer commit: `docker-compose exec web bin/rails test`
3. **Não commitar** arquivos `.env` ou dados sensíveis
4. **Usar commits descritivos** seguindo convenções da equipe
5. **Testar localmente** antes de abrir PR
6. **Documentar** novas funcionalidades no código

## 📚 Tecnologias Utilizadas

- **Ruby on Rails 7.1**
- **PostgreSQL** (banco de dados)
- **Tailwind CSS** (estilização)
- **Docker & Docker Compose** (containerização)
- **Devise** (autenticação)
- **CanCan** (autorização)
- **Rolify** (gerenciamento de roles)

---

## 🤝 Contribuindo

Para contribuir com o projeto:

1. Faça fork do repositório
2. Crie uma branch para sua feature (`git checkout -b feature/nova-funcionalidade`)
3. Execute a sequência de desenvolvimento limpo
4. Desenvolva e teste suas alterações
5. Execute todos os testes: `docker-compose exec web bin/rails test`
6. Commit suas mudanças (`git commit -am 'Adiciona nova funcionalidade'`)
7. Push para a branch (`git push origin feature/nova-funcionalidade`)
8. Abra um Pull Request

---

Para dúvidas ou problemas, consulte a equipe ou abra uma issue no repositório.