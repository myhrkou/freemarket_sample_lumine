class CreateCategory2s < ActiveRecord::Migration[5.0]
  def change
    create_table :category2s do |t|
      t.string :name
      t.references :category1
      t.timestamps
    end
  end
end
