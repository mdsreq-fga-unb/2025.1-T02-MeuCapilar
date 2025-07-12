class Terapeuta::AtendimentosController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_terapeuta
  before_action :set_atendimento, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :atendimento, class: 'Atendimento'

  def index
    # Base query - todos os atendimentos do terapeuta
    @atendimentos = current_user.terapeuta.atendimentos
                               .includes(:paciente)

    # Aplicar filtros se fornecidos
    if params[:paciente_id].present?
      @atendimentos = @atendimentos.where(paciente_id: params[:paciente_id])
    end

    if params[:data].present?
      data = Date.parse(params[:data])
      @atendimentos = @atendimentos.where(data: data.beginning_of_day..data.end_of_day)
    end

    if params[:servico].present?
      @atendimentos = @atendimentos.where('servico ILIKE ?', "%#{params[:servico]}%")
    end

    if params[:status].present?
      @atendimentos = @atendimentos.where(status: params[:status])
    end

    # Ordenação: se há filtros ativos, ordenar por mais recentes primeiro (histórico)
    # se não há filtros, manter ordenação original (agenda)
    if params[:paciente_id].present? || params[:data].present? || params[:servico].present? || params[:status].present?
      @atendimentos = @atendimentos.order(data: :desc) # Histórico: mais recentes primeiro
    else
      @atendimentos = @atendimentos.order(data: :asc)  # Agenda: próximos primeiro
    end

    # Paginação
    @atendimentos = @atendimentos.page(params[:page]).per(15)

    # Dados para os filtros
    @pacientes = current_user.terapeuta.pacientes.order(:nome)
    @servicos = current_user.terapeuta.atendimentos.distinct.pluck(:servico).compact.sort
    @status_options = Atendimento.statuses.keys.map { |s| [s.humanize, s] }
  end

  def show
    @paciente = @atendimento.paciente
    @registros_clinicos = @paciente.registros_clinicos
                                   .where(terapeuta: current_user.terapeuta)
                                   .order(data_registro: :desc)
                                   .limit(5)
  end

  def new
    @atendimento = Atendimento.new
    @atendimento.terapeuta = current_user.terapeuta
    @pacientes = Paciente.order(:nome)
    preparar_dados_calendario
  end

  def create
    @atendimento = Atendimento.new(atendimento_params)
    @atendimento.terapeuta = current_user.terapeuta
    @pacientes = Paciente.order(:nome)

    # Processar data e hora do modal (formato: "2025-06-23 08:00:00")
    if params[:atendimento][:data].present?
      begin
        # O modal envia data e hora juntas no formato "YYYY-MM-DD HH:MM:SS"
        # Usar Time.zone.parse para interpretar no timezone configurado
        data_hora = Time.zone.parse(params[:atendimento][:data])
        @atendimento.data = data_hora
      rescue ArgumentError => e
        @atendimento.errors.add(:data, "formato de data ou hora inválido")
      end
    end

    if @atendimento.save
      redirect_to terapeuta_atendimento_path(@atendimento), 
                  notice: 'Atendimento agendado com sucesso!'
    else
      preparar_dados_calendario
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @pacientes = Paciente.order(:nome)
  end

  def update
    # Combinar data e hora se fornecidos separadamente
    if params[:atendimento][:data].present? && params[:atendimento][:hora].present?
      begin
        data = Date.parse(params[:atendimento][:data])
        hora = Time.parse(params[:atendimento][:hora])
        # Usar Time.zone.local para criar no timezone configurado
        params[:atendimento][:data] = Time.zone.local(data.year, data.month, data.day, hora.hour, hora.min)
      rescue ArgumentError
        @atendimento.errors.add(:data, "formato de data ou hora inválido")
      end
    end

    if @atendimento.update(atendimento_params)
      redirect_to terapeuta_atendimento_path(@atendimento), 
                  notice: 'Atendimento atualizado com sucesso!'
    else
      @pacientes = Paciente.order(:nome)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @atendimento.destroy
    redirect_to terapeuta_atendimentos_path, 
                notice: 'Atendimento cancelado com sucesso!'
  end

  private

  def preparar_dados_calendario
    # Calcular semana baseada no parâmetro ou usar semana atual
    if params[:week].present?
      data_base = Date.parse(params[:week])
    else
      data_base = Time.zone.today
    end
    
    # Calcular início e fim da semana (segunda a domingo)
    @data_inicio_semana = data_base.beginning_of_week(:monday)
    @data_fim_semana = @data_inicio_semana + 6.days
    
    # Buscar atendimentos da semana selecionada usando Time.zone
    @atendimentos_semana = current_user.terapeuta.atendimentos
                                        .where(data: @data_inicio_semana.beginning_of_day..@data_fim_semana.end_of_day)
                                        .includes(:paciente)
    
    # Criar hash de horários ocupados para facilitar a verificação
    @horarios_ocupados = {}
    @atendimentos_semana.each do |atendimento|
      # Usar duração padrão de 30 minutos se não estiver definida
      duracao = atendimento.duracao || 30
      
      # Calcular todos os intervalos de 30 minutos que este atendimento ocupa
      inicio = atendimento.data
      fim = inicio + duracao.minutes
      
      # Gerar todos os horários de 30 minutos que este atendimento ocupa
      horario_atual = inicio
      while horario_atual < fim
        data_key = horario_atual.to_date.to_s
        hora_key = horario_atual.strftime("%H:%M")
        @horarios_ocupados[data_key] ||= []
        @horarios_ocupados[data_key] << hora_key
        horario_atual += 30.minutes
      end
    end
    
    # Definir horários comerciais (8h às 18h, intervalos de 30 minutos)
    @horarios_comerciais = []
    (8..17).each do |hora|
      @horarios_comerciais << "#{hora.to_s.rjust(2, '0')}:00"
      @horarios_comerciais << "#{hora.to_s.rjust(2, '0')}:30"
    end
    
    # Nomes dos dias da semana em português
    nomes_dias = ['Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado', 'Domingo']
    nomes_curtos = ['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb', 'Dom']
    nomes_meses = ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez']
    
    # Gerar dias da semana (segunda a domingo)
    @dias_semana = []
    (0..6).each do |i|
      data = @data_inicio_semana + i.days
      @dias_semana << {
        data: data,
        nome: nomes_dias[i],
        nome_curto: nomes_curtos[i],
        dia: data.day,
        mes: nomes_meses[data.month - 1]
      }
    end
  end

  def set_atendimento
    @atendimento = current_user.terapeuta.atendimentos.find(params[:id])
  end

  def atendimento_params
    params.require(:atendimento).permit(:paciente_id, :data, :servico, :status, :observacoes, :duracao)
  end

  def ensure_terapeuta
    unless current_user&.has_role?(:terapeuta)
      redirect_to new_user_session_path, alert: 'Acesso restrito para terapeutas.'
    end
  end
end 