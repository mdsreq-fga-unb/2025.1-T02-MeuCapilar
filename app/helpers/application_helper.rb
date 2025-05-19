module ApplicationHelper
  # Verifica se existe um usuário autenticado
  def user_signed_in?
    current_user.present?
  end
  
  # Verifica se o usuário atual é um terapeuta
  def terapeuta_signed_in?
    user_signed_in? && current_user.terapeuta?
  end
  
  # Verifica se o usuário atual é um paciente
  def paciente_signed_in?
    user_signed_in? && current_user.paciente?
  end
  
  # Retorna o nome apropriado para o tipo de usuário
  def nome_tipo_usuario(tipo)
    case tipo
    when 'therapist'
      'Terapeuta'
    when 'patient'
      'Paciente'
    else
      'Usuário'
    end
  end
end
