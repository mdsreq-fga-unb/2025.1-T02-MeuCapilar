# frozen_string_literal: true

# Tentar carregar activestorage-validator
begin
  require 'active_storage_validations'
rescue LoadError => e
  puts "Não foi possível carregar active_storage_validations: #{e.message}"
end 