class CreateAtendimentos < ActiveRecord::Migration[7.1]
  def change
    create_table :atendimentos do |t|
      t.references :paciente, null: false, foreign_key: true
      t.references :terapeuta, null: false, foreign_key: true
      t.datetime :data
      t.string :servico
      t.string :status
      t.text :observacoes

      t.timestamps
    end
  end
end
