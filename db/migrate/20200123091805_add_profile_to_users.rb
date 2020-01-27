class AddProfileToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :image, :string
    add_column :users, :content, :string
  end
end
