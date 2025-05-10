class ImageConverter < ApplicationRecord
  has_many_attached :original_images
  has_many_attached :converted_images
  
  validates :original_images, attached: true, 
                              content_type: ['image/bmp'],
                              limit: { max: 10, message: 'limite máximo de 10 imagens excedido' }
  
  after_commit :convert_images, on: :create
  
  private
  
  def convert_images
    # Verificar se há imagens para converter
    return unless original_images.attached?
    
    original_images.each do |image|
      begin
        # Download do blob para um arquivo temporário
        temp_input = Tempfile.new(['input', '.bmp'])
        temp_output = Tempfile.new(['output', '.png'])
        
        begin
          # Download manual do conteúdo do blob
          downloaded_image = image.download
          temp_input.binmode
          temp_input.write(downloaded_image)
          temp_input.flush
          
          # Converte a imagem de BMP para PNG usando MiniMagick
          mini_image = MiniMagick::Image.open(temp_input.path)
          mini_image.format('png')
          mini_image.write(temp_output.path)
          
          # Anexa a imagem convertida ao model
          temp_output.rewind
          converted_images.attach(
            io: temp_output,
            filename: "#{image.filename.base}.png",
            content_type: 'image/png'
          )
        rescue => e
          Rails.logger.error("Erro ao converter imagem: #{e.message}")
          Rails.logger.error(e.backtrace.join("\n"))
        ensure
          # Garantir que os arquivos temporários sejam fechados e removidos
          temp_input.close
          temp_input.unlink
          temp_output.close
          temp_output.unlink
        end
      rescue => e
        Rails.logger.error("Erro ao processar imagem: #{e.message}")
        Rails.logger.error(e.backtrace.join("\n"))
      end
    end
  end
end 