class ChangeDataOptionToUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :point, :integer, default: 0
  end
end