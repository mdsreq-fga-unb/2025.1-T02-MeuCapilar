class CreateSessionsAndAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :sessions do |t|
      t.references :therapist, foreign_key: { to_table: :users }
      t.references :patient, foreign_key: { to_table: :users }
      t.datetime :session_date
      t.text :notes
      t.text :diagnosis
      t.decimal :value, precision: 10, scale: 2
      t.string :payment_status

      t.timestamps
    end

    create_table :appointments do |t|
      t.references :therapist, foreign_key: { to_table: :users }
      t.references :patient, foreign_key: { to_table: :users }
      t.datetime :date
      t.string :status
      t.text :comments

      t.timestamps
    end
  end
end 