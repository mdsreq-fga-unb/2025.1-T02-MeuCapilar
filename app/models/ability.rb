# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    if user.has_role?(:terapeuta)
      # Permissões da Terapeuta
      can :read, :terapeuta_dashboard
      can :manage, Paciente
      can :manage, Atendimento
      can :manage, RegistroClinico
      can :read, Terapeuta, user: user
      can :update, Terapeuta, user: user
      
      # Pode ver apenas seus próprios atendimentos e registros
      can :read, Atendimento, terapeuta: { user: user }
      can :read, RegistroClinico, terapeuta: { user: user }
      
    elsif user.has_role?(:paciente)
      # Permissões do Paciente
      can :read, :paciente_dashboard
      can :read, Paciente, user: user
      can :update, Paciente, user: user
      
      # Pode ver apenas seus próprios atendimentos e registros
      can :read, Atendimento, paciente: { user: user }
      can :read, RegistroClinico, paciente: { user: user }
    end

    # Permissões básicas para todos os usuários autenticados
    can :read, User, id: user.id
    can :update, User, id: user.id
  end
end
