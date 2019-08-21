class AddDeletedToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :deleted, :boolean
  end
end
