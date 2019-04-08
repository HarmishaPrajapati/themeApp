class RemoveGenderFromVisitors < ActiveRecord::Migration[5.2]
  def change
    remove_column :visitors, :gender, :string
  end
end
