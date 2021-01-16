class Cart < ApplicationRecord
	has_many :line_items

	def self.cal_total(line_items)
		sum = 0
		line_items.each do |line_item| 
			sum = sum + (line_item.quantity * line_item.product.unit_price) 
		end 
		return sum
	end

	def shopper_name(sID)
		@shopper = Shopper.find(sID)
		email = @shopper.email
	end
end
