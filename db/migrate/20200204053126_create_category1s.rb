class CreateCategory1s < ActiveRecord::Migration[5.0]
  def change
    create_table :category1s do |t|
      t.string :name
      t.references :category0, foreign_key: true
      t.timestamps
    end
  end
end
