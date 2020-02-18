class AddPriceToVouchers < ActiveRecord::Migration[5.0]
  def change
    add_column :vouchers, :price, :integer
  end
end
