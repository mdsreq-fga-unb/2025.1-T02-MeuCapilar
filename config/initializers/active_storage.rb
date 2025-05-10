# frozen_string_literal: true

# Configuração do Active Storage
Rails.application.config.active_storage.variable_content_types = %w(
  image/png
  image/gif
  image/jpg
  image/jpeg
  image/bmp
  image/tiff
  image/vnd.adobe.photoshop
)

# Configure o analisador de conteúdo para BMP
Rails.application.config.active_storage.content_types_to_serve_as_binary += ['image/bmp'] 