class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :guest, null: false, foreign_key: true
      t.string :code
      t.text :payload
      t.timestamps
    end
  end
end
