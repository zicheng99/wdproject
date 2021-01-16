class ChangeColumnName2 < ActiveRecord::Migration[6.1]
  def change
  	  	rename_column :admin_promocodes, :dtype, :discount_type
  end
end
