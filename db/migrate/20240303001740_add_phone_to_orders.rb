class AddPhoneToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :phone, :decimal
  end
end
