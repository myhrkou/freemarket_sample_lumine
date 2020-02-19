class CreateVouchers < ActiveRecord::Migration[5.0]
  def change
    create_table :vouchers do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.timestamps
    end
  end
end
