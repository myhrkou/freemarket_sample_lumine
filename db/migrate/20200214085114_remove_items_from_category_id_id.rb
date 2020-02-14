class RemoveItemsFromCategoryIdId < ActiveRecord::Migration[5.0]
  def up
    remove_column :items, :category_id_id
  end
end
