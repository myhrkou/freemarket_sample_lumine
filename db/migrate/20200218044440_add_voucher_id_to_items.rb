class AddVoucherIdToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :voucher, foreign_key: true
  end
end
