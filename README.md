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

## Como subir o ambiente

# MeuCapilar - Ambiente de Desenvolvimento com Docker

Este README fornece as instruções para configurar o ambiente de desenvolvimento deste projeto Rails utilizando Docker e Docker Compose. Isso garante um ambiente consistente para todos os membros da equipe.

## Pré-requisitos

Antes de começar, certifique-se de que as seguintes ferramentas estejam instaladas em sua máquina:

* **Docker:** [Instruções de instalação do Docker](https://docs.docker.com/engine/install/)
* **Docker Compose:** [Instruções de instalação do Docker Compose](https://docs.docker.com/compose/install/)

## Passo a Passo para Configurar o Ambiente

Siga estas etapas para iniciar o ambiente de desenvolvimento do projeto:

1.  **Clonar o Repositório:**

    Primeiro, clone o repositório do projeto para sua máquina local utilizando o Git:

    ```bash
    git clone https://github.com/mdsreq-fga-unb/2025.1-T02-MeuCapilar.git
    cd 2025.1-T02-MeuCapilar
    ```


2.  **Configurar as Variáveis de Ambiente:**

    Na raiz do projeto, você encontrará um arquivo `.env.example`. Copie este arquivo para `.env`:

    ```bash
    cp .env.example .env
    ```

    Abra o arquivo `.env` e configure as variáveis de ambiente necessárias, como as credenciais do banco de dados:

    ```
    DB_USERNAME=postgres
    DB_PASSWORD=postgres
    ```

    Essas variáveis serão utilizadas pelo Docker Compose para configurar o serviço PostgreSQL.

3.  **Iniciar os Containers Docker:**

    Na raiz do diretório do projeto, execute o seguinte comando para construir as imagens Docker (se necessário) e iniciar os containers definidos no arquivo `docker-compose.yml`:

    ```bash
    docker-compose up --build
    ```

    * O flag `--build` garante que a imagem da aplicação web seja construída utilizando as instruções do `Dockerfile`. Isso é necessário na primeira vez que você executa o comando ou sempre que o `Dockerfile` for modificado.

4.  **Criar e Migrar o Banco de Dados:**

    Após a conclusão do processo, entre no container da aplicação web para executar os comandos do Rails que criarão o banco de dados e executarão as migrations:

    ```bash
    docker-compose exec web bin/rails db:create db:migrate
    ```

    Este comando primeiro cria o banco de dados PostgreSQL (se ainda não existir) e depois executa as migrations definidas no seu projeto Rails para configurar as tabelas.

5.  **Acessar a Aplicação Rails:**

    Após a conclusão das migrations, a aplicação Rails estará acessível no seu navegador através do seguinte endereço:

    ```
    http://localhost:3000
    ```

6.  **Executar Outros Comandos Rails (dentro do Container):**

    Para executar outros comandos do Rails, como console ou testes, continue usando o prefixo `docker-compose exec web`:

    ```bash
    docker-compose exec web bin/rails console
    docker-compose exec web bin/rspec
    # ou outros comandos Rails que você precise executar
    ```


## Configuração do Banco de Dados

O arquivo `docker-compose.yml` configura um serviço PostgreSQL chamado `db`. As configurações de nome de usuário e senha são definidas através das variáveis de ambiente `DB_USERNAME` e `DB_PASSWORD` no arquivo `.env`. O container da aplicação Rails (`web`) está configurado para se conectar a este banco de dados através do nome de serviço `db` (definido na variável de ambiente `DB_HOST`).

## Desenvolvimento

Como o volume `./:/app` está configurado no serviço `web` do `docker-compose.yml`, as alterações que você fizer nos arquivos do seu projeto local serão automaticamente refletidas dentro do container. No entanto, para algumas alterações (como adicionar novas gems ao `Gemfile`), você pode precisar reconstruir o container da aplicação:

```bash
docker-compose build web
docker-compose up -d