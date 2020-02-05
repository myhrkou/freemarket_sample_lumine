class AddCategory2IdToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :category2, foreign_key: true
  end
end
