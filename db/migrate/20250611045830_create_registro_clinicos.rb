class CreateRegistroClinicos < ActiveRecord::Migration[7.1]
  def change
    create_table :registro_clinicos do |t|
      t.references :paciente, null: false, foreign_key: true
      t.references :terapeuta, null: false, foreign_key: true
      t.text :diagnostico
      t.text :tratamento
      t.text :observacoes
      t.datetime :data_registro

      t.timestamps
    end
  end
end
