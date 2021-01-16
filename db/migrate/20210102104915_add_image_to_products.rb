class AddImageToProducts < ActiveRecord::Migration[6.1]
  def up
    add_attachment :products, :image
  end

  def down
    remove_attachment :products, :image
  end
end
