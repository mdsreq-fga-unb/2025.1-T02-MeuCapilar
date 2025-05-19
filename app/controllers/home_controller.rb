# Index baśica pra começarmos a testar o ambiente
class HomeController < ApplicationController
    def index
        # Armazena o tipo de usuário na sessão se for passado como parâmetro
        session[:user_type] = params[:user_type] if params[:user_type].present?
    end
  end