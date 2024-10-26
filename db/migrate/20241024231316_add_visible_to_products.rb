class AddVisibleToProducts < ActiveRecord::Migration[7.2]
  def change
    add_column :products, :visible, :boolean, default: true
  end
end
