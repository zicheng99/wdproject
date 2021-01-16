class RemoveColumnFromShoppers < ActiveRecord::Migration[6.1]
  def change
  	rename_column :shoppers, :current_password, :crpw
  	rename_column :shoppers, :new_password, :npw
  	rename_column :shoppers, :confirm_password, :cfpw
  end
end
