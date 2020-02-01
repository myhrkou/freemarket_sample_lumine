class AddBuyerToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :buyer, :integer
  end
end
