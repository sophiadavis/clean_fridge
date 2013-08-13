class AddFridgeIdToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :fridge_id, :integer
  end
end
