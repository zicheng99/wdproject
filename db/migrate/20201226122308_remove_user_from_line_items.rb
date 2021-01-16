class RemoveUserFromLineItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :line_items, :user_id, :integer
  end
end
