class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :stock
      t.decimal :price
      t.integer :rank
      t.integer :idCategory
      t.integer :idProduct

      t.timestamps
    end
  end
end
