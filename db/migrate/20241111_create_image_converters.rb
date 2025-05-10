class CreateImageConverters < ActiveRecord::Migration[7.1]
  def change
    create_table :image_converters do |t|
      t.string :name
      t.timestamps
    end
  end
end 