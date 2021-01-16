class AddShopperIdToLineItems < ActiveRecord::Migration[6.1]
  def change
    add_column :line_items, :shopper_id, :integer
  end
end
