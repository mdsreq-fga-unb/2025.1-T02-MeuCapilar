#!/bin/bash

# 📧 Script de Teste de E-mails - MeuCapilar
# Uso: ./teste_emails.sh [comando]

DOCKER_CMD="sudo docker-compose exec web bundle exec rails"

show_help() {
    echo "📧 TESTE DE E-MAILS - MEUCAPILAR"
    echo "================================"
    echo ""
    echo "Comandos disponíveis:"
    echo "  setup          - Configurar ambiente"
    echo "  terapeuta      - Criar terapeuta de teste"
    echo "  paciente       - Criar paciente de teste"
    echo "  link           - Encontrar último link de confirmação"
    echo "  reset          - Solicitar reset de senha"
    echo "  reset-link     - Encontrar link de reset"
    echo "  listar         - Listar usuários de teste"
    echo "  limpar         - Limpar dados de teste"
    echo "  fluxo          - Mostrar fluxo completo"
    echo ""
    echo "Exemplo: ./teste_emails.sh terapeuta"
    echo ""
}

case "$1" in
    "setup")
        echo "🚀 Configurando ambiente..."
        $DOCKER_CMD email_test:setup
        ;;
    "terapeuta")
        echo "👩‍⚕️ Criando terapeuta..."
        $DOCKER_CMD email_test:create_terapeuta
        echo ""
        echo "▶️  Próximo passo: ./teste_emails.sh link"
        ;;
    "paciente")
        echo "👤 Criando paciente..."
        $DOCKER_CMD email_test:create_paciente
        echo ""
        echo "▶️  Próximo passo: ./teste_emails.sh link"
        ;;
    "link")
        echo "🔍 Procurando link de confirmação..."
        $DOCKER_CMD email_test:find_confirmation_link
        ;;
    "reset")
        echo "🔄 Solicitando reset de senha..."
        $DOCKER_CMD email_test:reset_password
        echo ""
        echo "▶️  Próximo passo: ./teste_emails.sh reset-link"
        ;;
    "reset-link")
        echo "🔍 Procurando link de reset..."
        $DOCKER_CMD email_test:find_reset_link
        ;;
    "listar")
        echo "👥 Listando usuários..."
        $DOCKER_CMD email_test:list_users
        ;;
    "limpar")
        echo "🧹 Limpando dados..."
        $DOCKER_CMD email_test:cleanup
        ;;
    "fluxo")
        echo "📋 Mostrando fluxo completo..."
        $DOCKER_CMD email_test:flow
        ;;
    *)
        show_help
        ;;
esac 