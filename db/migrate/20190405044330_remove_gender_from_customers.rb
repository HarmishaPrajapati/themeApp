class RemoveGenderFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :gender, :string
  end
end
