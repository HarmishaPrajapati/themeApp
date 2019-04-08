class AddQualityToCleaners < ActiveRecord::Migration[5.2]
  def change
    add_column :cleaners, :quality_score, :numeric
  end
end
