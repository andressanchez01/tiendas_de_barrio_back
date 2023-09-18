class ChangeFieldTypeOfOldField < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :phone, :decimal
    change_column :users, :fiscal_number, :decimal
  end
end
