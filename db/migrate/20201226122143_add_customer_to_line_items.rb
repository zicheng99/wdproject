class AddCustomerToLineItems < ActiveRecord::Migration[6.1]
  def change
    add_column :line_items, :customer_id, :integer
  end
end
