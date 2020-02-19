class CreateUsedVoucherUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :used_voucher_users do |t|
      t.references :voucher, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
