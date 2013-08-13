class AddExpirationDateToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :expiration_date, :datetime
  end
  
  add_index :foods, [:user_id, :fridge_id]
end
