require 'prawn'
require 'prawn/table'

class RegistroClinicoPdfService
  include ActionView::Helpers::TextHelper
  
  def initialize(registro_clinico)
    @registro_clinico = registro_clinico
    @paciente = registro_clinico.paciente
    @terapeuta = registro_clinico.terapeuta
  end

  def generate
    Prawn::Document.new(
      page_size: 'A4',
      margin: [40, 50, 40, 50]
    ) do |pdf|
      
      # Configurar fontes
      setup_fonts(pdf)
      
      # Cabeçalho com logo/identidade visual
      draw_header(pdf)
      
      # Informações do paciente e registro
      draw_patient_info(pdf)
      
      # Conteúdo do registro clínico
      draw_clinical_content(pdf)
      
      # Imagens (se houver)
      draw_images(pdf) if @registro_clinico.tem_imagens?
      
      # Rodapé com assinatura da terapeuta
      draw_footer(pdf)
      
      # Numeração de páginas
      add_page_numbers(pdf)
      
    end
  end

  private

  def setup_fonts(pdf)
    # Usar fontes padrão do Prawn para melhor compatibilidade
    pdf.font_families.update(
      "Helvetica" => {
        normal: "Helvetica",
        bold: "Helvetica-Bold",
        italic: "Helvetica-Oblique"
      }
    )
    pdf.font "Helvetica"
  end

  def draw_header(pdf)
    # Cores da marca
    primary_color = 'EC4899'  # Rosa
    secondary_color = '7C3AED' # Roxo
    
    # Banner superior com gradiente simulado
    pdf.fill_color primary_color
    pdf.fill_rectangle [0, pdf.cursor], pdf.bounds.width, 60
    
    # Título principal
    pdf.fill_color 'FFFFFF'
    pdf.font_size 24
    pdf.text_box "Meu Capilar", 
                 at: [20, pdf.cursor - 15], 
                 style: :bold,
                 color: 'FFFFFF'
    
    pdf.font_size 12
    pdf.text_box "Relatório de Registro Clínico", 
                 at: [20, pdf.cursor - 40], 
                 color: 'FFFFFF'
    
    # Data de emissão
    pdf.text_box "Emitido em: #{Date.current.strftime('%d/%m/%Y')}", 
                 at: [pdf.bounds.width - 150, pdf.cursor - 15], 
                 color: 'FFFFFF'
    
    pdf.move_down 80
    pdf.fill_color '000000' # Voltar para preto
  end

  def draw_patient_info(pdf)
    # Seção de informações do paciente
    pdf.fill_color 'F3F4F6'
    pdf.fill_rectangle [0, pdf.cursor], pdf.bounds.width, 100
    
    pdf.fill_color '000000'
    pdf.move_down 10
    
    pdf.font_size 14
    pdf.text "INFORMAÇÕES DO PACIENTE", style: :bold, color: '374151'
    pdf.move_down 8
    
    # Tabela com informações do paciente (removido CPF)
    patient_data = [
      ["Nome:", @paciente.nome],
      ["Telefone:", @paciente.telefone_formatado],
      ["Idade:", "#{@paciente.idade} anos"]
    ]
    
    pdf.table(patient_data, 
              cell_style: { borders: [], padding: [2, 5] },
              column_widths: [80, 400]) do
      columns(0).style(font_style: :bold, text_color: '6B7280')
      columns(1).style(text_color: '111827')
    end
    
    pdf.move_down 20
  end

  def draw_clinical_content(pdf)
    # Informações do registro
    pdf.font_size 14
    pdf.text "DADOS DO REGISTRO CLÍNICO", style: :bold, color: '374151'
    pdf.move_down 8
    
    registro_data = [
      ["Tipo de Registro:", @registro_clinico.tipo_registro_humanizado],
      ["Data do Registro:", @registro_clinico.data_formatada],
      ["Próxima Consulta:", @registro_clinico.proxima_consulta&.strftime("%d/%m/%Y") || "Não agendada"]
    ]
    
    pdf.table(registro_data, 
              cell_style: { borders: [], padding: [2, 5] },
              column_widths: [100, 380]) do
      columns(0).style(font_style: :bold, text_color: '6B7280')
      columns(1).style(text_color: '111827')
    end
    
    pdf.move_down 15
    
    # Queixa Principal
    draw_section(pdf, "QUEIXA PRINCIPAL", @registro_clinico.queixa_principal)
    
    # Diagnóstico/Avaliação
    draw_section(pdf, "DIAGNÓSTICO/AVALIAÇÃO", @registro_clinico.diagnostico)
    
    # Tratamento (se presente)
    if @registro_clinico.tratamento.present?
      draw_section(pdf, "TRATAMENTO REALIZADO", @registro_clinico.tratamento)
    end
    
    # Plano Terapêutico (se presente)
    if @registro_clinico.plano_terapeutico.present?
      draw_section(pdf, "PLANO TERAPÊUTICO", @registro_clinico.plano_terapeutico)
    end
    
    # Observações (se presente)
    if @registro_clinico.observacoes.present?
      draw_section(pdf, "OBSERVAÇÕES GERAIS", @registro_clinico.observacoes)
    end
  end

  def draw_section(pdf, title, content)
    # Verificar se há espaço suficiente na página
    if pdf.cursor < 100
      pdf.start_new_page
    end
    
    pdf.font_size 12
    pdf.text title, style: :bold, color: 'EC4899'
    pdf.move_down 5
    
    # Linha divisória
    pdf.stroke_color 'E5E7EB'
    pdf.stroke_horizontal_rule
    pdf.move_down 8
    
    pdf.font_size 10
    pdf.text content, align: :justify, leading: 3, color: '374151'
    pdf.move_down 15
    
    pdf.stroke_color '000000' # Resetar cor
  end

  def draw_images(pdf)
    return unless @registro_clinico.tem_imagens?
    
    pdf.start_new_page
    
    pdf.font_size 14
    pdf.text "IMAGENS DO REGISTRO", style: :bold, color: '374151'
    pdf.text "Total: #{@registro_clinico.total_imagens} #{@registro_clinico.total_imagens == 1 ? 'imagem' : 'imagens'}", 
             size: 10, color: '6B7280'
    pdf.move_down 10
    
    images_per_page = 2
    current_images = 0
    
    @registro_clinico.imagens.each_with_index do |imagem, index|
      begin
        # Verificar se precisa de nova página
        # Deixar espaço para assinatura se for a última imagem
        space_needed = (index == @registro_clinico.total_imagens - 1) ? 300 : 250
        
        if current_images >= images_per_page || pdf.cursor < space_needed
          pdf.start_new_page
          current_images = 0
        end
        
        # Baixar a imagem
        image_data = imagem.download
        
        # Criar arquivo temporário
        temp_file = Tempfile.new(['registro_image', '.png'])
        temp_file.binmode
        temp_file.write(image_data)
        temp_file.rewind
        
        # Adicionar imagem ao PDF
        pdf.text "Imagem #{index + 1}:", style: :bold, size: 10
        pdf.move_down 5
        
        # Calcular dimensões mantendo proporção
        max_width = pdf.bounds.width - 40
        max_height = 200  # Reduzido de 200 para 180 para dar mais espaço
        
        pdf.image temp_file.path, 
                  fit: [max_width, max_height],
                  position: :center
        
        pdf.move_down 20
        current_images += 1
        
        temp_file.close
        temp_file.unlink
        
      rescue => e
        Rails.logger.error "Erro ao processar imagem #{index + 1}: #{e.message}"
        pdf.text "Erro ao carregar Imagem #{index + 1}", style: :italic, color: 'DC2626'
        pdf.move_down 10
      end
    end
  end

  def draw_footer(pdf)
    # Verificar se há espaço suficiente na página atual para a assinatura
    # Espaço necessário: 120px para assinatura completa
    required_space = 120
    
    if pdf.cursor < required_space
      pdf.start_new_page
    end
    
    # Garantir que há espaço suficiente movendo para baixo
    pdf.move_down 30
    
    # Linha para assinatura
    pdf.stroke_color 'D1D5DB'
    pdf.move_down 40
    pdf.stroke_horizontal_rule
    pdf.move_down 5
    
    pdf.font_size 10
    pdf.text "#{@terapeuta.nome}", style: :bold, align: :center
    pdf.text "#{@terapeuta.especialidade}", align: :center, color: '6B7280'
    pdf.text "Telefone: #{@terapeuta.telefone_formatado}", align: :center, color: '6B7280'
    
    pdf.move_down 10
    pdf.text "Este relatório foi gerado automaticamente pelo sistema Meu Capilar", 
             size: 8, align: :center, color: '9CA3AF'
  end

  def add_page_numbers(pdf)
    pdf.number_pages "Página <page> de <total>", 
                     at: [pdf.bounds.right - 100, 15], 
                     width: 100, 
                     align: :right, 
                     size: 8, 
                     color: '6B7280'
  end
end 