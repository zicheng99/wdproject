class AddDiscountToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :discount, :decimal
  end
end
