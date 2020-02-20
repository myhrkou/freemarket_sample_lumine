class AddUsedPointToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :used_point, :integer
  end
end
