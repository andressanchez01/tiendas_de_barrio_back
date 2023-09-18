class AddCostToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :cost, :decimal
  end
end
