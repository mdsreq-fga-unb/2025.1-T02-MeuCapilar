class AddDuracaoToAtendimentos < ActiveRecord::Migration[7.1]
  def change
    add_column :atendimentos, :duracao, :integer
  end
end
