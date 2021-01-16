class AddStatusToLineItems < ActiveRecord::Migration[6.1]
  def change
    add_column :line_items, :status, :string
  end
end
