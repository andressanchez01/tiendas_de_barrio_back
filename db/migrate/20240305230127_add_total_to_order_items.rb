class AddTotalToOrderItems < ActiveRecord::Migration[7.0]
  def change
    add_column :order_items, :total, :decimal
  end
end
