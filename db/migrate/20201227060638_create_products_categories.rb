class CreateProductsCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :products_categories do |t|
      t.string :product_id
      t.string :category_id

      t.timestamps
    end
  end
end
