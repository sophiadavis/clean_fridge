class AddDeleteCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :delete_count, :integer, nil: false
  end
end
