class AddPointToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :point, :integer
  end
end
