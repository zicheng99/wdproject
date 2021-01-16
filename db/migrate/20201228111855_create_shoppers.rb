class CreateShoppers < ActiveRecord::Migration[6.1]
  def change
    create_table :shoppers do |t|
      t.string :email
      t.string :address
      t.string :name
      t.string :current_password
      t.string :new_password

      t.timestamps
    end
  end
end
