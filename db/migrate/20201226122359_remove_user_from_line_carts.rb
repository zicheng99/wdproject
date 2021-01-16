class RemoveUserFromLineCarts < ActiveRecord::Migration[6.1]
  def change
    remove_column :carts, :user_id, :integer
  end
end
