class CreateAdminNAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_n_admins do |t|
      t.string :email
      t.string :crpw

      t.timestamps
    end
  end
end
