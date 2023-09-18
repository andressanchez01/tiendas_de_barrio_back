class AddAttributesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :text
    add_column :users, :phone, :integer
    add_column :users, :address, :string
    add_column :users, :fiscal_number, :integer
  end
end
