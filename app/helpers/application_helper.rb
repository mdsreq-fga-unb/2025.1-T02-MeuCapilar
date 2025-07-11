module ApplicationHelper
  def image_url_for_display(attachment)
    # SEMPRE usar variant PNG para garantir compatibilidade com navegadores
    variant = attachment.variant(format: :png)
    url_for(variant)
  end
  
  def image_tag_for_display(attachment, options = {})
    # SEMPRE usar variant PNG para garantir compatibilidade com navegadores
    variant = attachment.variant(format: :png)
    image_tag(variant, options)
  end
  
  # Método para detectar se uma imagem foi originalmente BMP (baseado no nome)
  def was_bmp_image?(attachment)
    attachment.filename.to_s.downcase.include?('.png') && 
    attachment.filename.to_s.downcase.include?('bmp')
  end
end
