class AddFieldsToRegistroClinicos < ActiveRecord::Migration[7.1]
  def change
    add_column :registro_clinicos, :tipo_registro, :string
    add_column :registro_clinicos, :queixa_principal, :text
    add_column :registro_clinicos, :plano_terapeutico, :text
    add_column :registro_clinicos, :proxima_consulta, :date
    add_reference :registro_clinicos, :atendimento, null: true, foreign_key: true
  end
end
