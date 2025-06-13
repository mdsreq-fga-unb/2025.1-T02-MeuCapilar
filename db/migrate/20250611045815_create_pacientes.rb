class CreatePacientes < ActiveRecord::Migration[7.1]
  def change
    create_table :pacientes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :nome
      t.string :cpf
      t.string :telefone
      t.date :data_nascimento
      t.text :endereco
      t.boolean :status

      t.timestamps
    end
  end
end
