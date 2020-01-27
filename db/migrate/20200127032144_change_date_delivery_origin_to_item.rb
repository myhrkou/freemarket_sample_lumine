class ChangeDateDeliveryOriginToItem < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :delivery_origin, :integer
  end
end
