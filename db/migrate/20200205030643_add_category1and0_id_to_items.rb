class AddCategory1and0IdToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :category1, foreign_key: true
    add_reference :items, :category0, foreign_key: true
  end
end
