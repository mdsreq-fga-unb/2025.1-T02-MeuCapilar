class AddMedicamentosUsoToPacientes < ActiveRecord::Migration[7.1]
  def change
    add_column :pacientes, :medicamentos_uso, :text
  end
end
