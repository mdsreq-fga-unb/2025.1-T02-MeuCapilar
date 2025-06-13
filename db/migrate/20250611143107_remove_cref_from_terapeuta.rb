class RemoveCrefFromTerapeuta < ActiveRecord::Migration[7.1]
  def change
    remove_column :terapeuta, :cref, :string
  end
end
