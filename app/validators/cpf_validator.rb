class CpfValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?

    # Remove caracteres não numéricos
    cpf = value.to_s.gsub(/\D/, '')

    # Verifica se tem 11 dígitos
    if cpf.length != 11
      record.errors.add(attribute, "deve ter 11 dígitos")
      return
    end

    # Verifica se não é uma sequência de números iguais
    if cpf.match(/^(\d)\1{10}$/)
      record.errors.add(attribute, "não pode ser uma sequência de números iguais")
      return
    end

    # Validação do primeiro dígito verificador
    soma = 0
    (0..8).each do |i|
      soma += cpf[i].to_i * (10 - i)
    end
    resto = soma % 11
    digito1 = resto < 2 ? 0 : 11 - resto

    if cpf[9].to_i != digito1
      record.errors.add(attribute, "é inválido")
      return
    end

    # Validação do segundo dígito verificador
    soma = 0
    (0..9).each do |i|
      soma += cpf[i].to_i * (11 - i)
    end
    resto = soma % 11
    digito2 = resto < 2 ? 0 : 11 - resto

    if cpf[10].to_i != digito2
      record.errors.add(attribute, "é inválido")
      return
    end
  end
end 