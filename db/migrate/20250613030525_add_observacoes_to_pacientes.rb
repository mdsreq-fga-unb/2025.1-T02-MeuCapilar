class AddObservacoesToPacientes < ActiveRecord::Migration[7.1]
  def change
    add_column :pacientes, :observacoes, :text
  end
end
