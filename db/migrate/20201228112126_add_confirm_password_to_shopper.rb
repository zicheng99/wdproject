class AddConfirmPasswordToShopper < ActiveRecord::Migration[6.1]
  def change
    add_column :shoppers, :confirm_password, :string
  end
end
