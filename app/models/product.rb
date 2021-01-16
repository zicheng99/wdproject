class Product < ApplicationRecord
	has_many :line_items

	has_many :products_categories
	has_many :categories, through: :products_categories

has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
