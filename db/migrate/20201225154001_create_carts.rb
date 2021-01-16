class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.string :status
      t.decimal :total

      t.timestamps
    end
  end
end
