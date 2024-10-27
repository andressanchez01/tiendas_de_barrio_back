class RenameIdCategoryToCategoryIdInProducts < ActiveRecord::Migration[7.2]
  def change
    rename_column :products, :idCategory, :category_id
  end
end
