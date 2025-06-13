class AddAlergiasToPacientes < ActiveRecord::Migration[7.1]
  def change
    add_column :pacientes, :alergias, :text
  end
end
