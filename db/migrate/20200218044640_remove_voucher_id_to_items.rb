class RemoveVoucherIdToItems < ActiveRecord::Migration[5.0]
  def up
    remove_column :items, :voucher_id_id
  end
end
