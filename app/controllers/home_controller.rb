# Index básica para começarmos a testar o ambiente
class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  skip_authorization_check

  def index
    # Se usuário estiver logado, redireciona para seu dashboard
    if user_signed_in?
      redirect_to after_sign_in_path_for(current_user)
    end
  end
end