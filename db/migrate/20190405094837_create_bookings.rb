class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :customer_name
      t.string :cleaner_name
      t.date :date

      t.timestamps
    end
  end
end
