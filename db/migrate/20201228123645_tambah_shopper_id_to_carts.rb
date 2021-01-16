class TambahShopperIdToCarts < ActiveRecord::Migration[6.1]
  def change
  	    add_column :carts, :shopper_id, :integer
  end
end
