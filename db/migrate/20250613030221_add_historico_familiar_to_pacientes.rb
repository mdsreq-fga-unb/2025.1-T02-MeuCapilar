class AddHistoricoFamiliarToPacientes < ActiveRecord::Migration[7.1]
  def change
    add_column :pacientes, :historico_familiar, :text
  end
end
