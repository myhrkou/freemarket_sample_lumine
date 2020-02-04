class RenameDeliveryOriginColumnToItems < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :delivery_origin, :delivery_origin_id
  end
end
