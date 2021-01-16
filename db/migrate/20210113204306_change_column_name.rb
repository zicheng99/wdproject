class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
  	rename_column :admin_promocodes, :type, :dtype
  end
end
