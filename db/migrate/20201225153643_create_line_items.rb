class CreateLineItems < ActiveRecord::Migration[6.1]
  def change
    create_table :line_items do |t|
      t.integer :product_id
      t.integer :cart_id
      t.decimal :subtotal
      t.integer :quantity
      t.timestamps
    end
  end
end
