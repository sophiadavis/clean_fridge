class AddIndexTofridgesUserId < ActiveRecord::Migration
  def change
  	add_index :fridges, :user_id
  end
end
