class CreateImageConversions < ActiveRecord::Migration[7.1]
  def change
    create_table :image_conversions do |t|
      t.timestamps
    end
  end
end