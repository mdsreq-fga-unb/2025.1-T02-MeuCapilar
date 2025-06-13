class CreateTerapeuta < ActiveRecord::Migration[7.1]
  def change
    create_table :terapeuta do |t|
      t.references :user, null: false, foreign_key: true
      t.string :nome
      t.string :cpf
      t.string :telefone
      t.string :especialidade
      t.string :cref
      t.boolean :status

      t.timestamps
    end
  end
end
