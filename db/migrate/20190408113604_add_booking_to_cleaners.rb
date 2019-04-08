class AddBookingToCleaners < ActiveRecord::Migration[5.2]
  def change
    add_reference :cleaners, :booking, foreign_key: true
  end
end
