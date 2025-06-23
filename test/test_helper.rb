ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

# Configurar Devise para testes
class ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
end

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Configurar timezone para testes
  setup do
    Time.zone = 'America/Sao_Paulo'
  end

  # Helper para criar usuários com roles
  def create_user_with_role(role_name, attributes = {})
    user = User.create!({
      email: "#{role_name}@teste.com",
      password: '123456',
      password_confirmation: '123456',
      user_type: role_name,
      status: true
    }.merge(attributes))
    
    user.add_role(role_name.to_sym)
    user
  end

  # Helper para login em testes de controller
  def sign_in_as(user)
    post user_session_path, params: {
      user: {
        email: user.email,
        password: '123456'
      }
    }
  end
end
