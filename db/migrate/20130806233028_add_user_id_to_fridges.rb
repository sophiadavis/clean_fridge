class AddUserIdToFridges < ActiveRecord::Migration
  def change
    add_column :fridges, :user_id, :integer
  end
end
