class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :customer_name
      t.string :address
      t.decimal :total_amount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
