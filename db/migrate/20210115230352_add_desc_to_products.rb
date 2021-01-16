class AddDescToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :desc, :string
  end
end
