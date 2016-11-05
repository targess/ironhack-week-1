require 'pry'
class ShoppingCart
	def initialize
		@items = {}
		@fruits_price = {apple: 10, orange: 5, grape: 20, banana: 20, watermelon: 50}
	end

	def add_item_to_cart(item)
		@items[item] ||= 0
		@items[item] += 1
	end
		
	def show
		@items.each do |name, quantity|
			price = calculate_price(name, quantity)
			print_item(name, quantity, price)
		end
	end

	def cost
		@items.reduce(0) do |sum, item|
			sum + calculate_price(item[0], item[1])
		end
	end

	def fruits_price(name)
		#@fruits_price[name]
		FruitsPrice.puts_price(name)
	end

	def calculate_price(name, quantity)
		 offer = amount_offer(name, quantity)
		 price = fruits_price(name) * quantity
		 if offer
		 	offer
		 else
		 	price
		 end
	end

	def amount_offer(name, quantity)
		if name == :apple
			apples_offer(quantity)
		elsif name == :orange
			orange_offer(quantity)
		elsif name == :grape
			grape_offer(quantity)
		end
	end

	def apples_offer(quantity)
		if quantity >= 2
			price = fruits_price(:apple) * (quantity / 2) + fruits_price(:apple) * (quantity % 2)
		end
	end

	def orange_offer(quantity)
		if quantity >= 3
			price = fruits_price(:orange) * (quantity / 3) + fruits_price(:orange) * (quantity % 3)
		end	
	end

	def grape_offer(quantity)
		if quantity >= 4
			puts "you get one banana for free if you want!"
		end
		fruits_price(:grape) * quantity
	end

	def print_item(name, quantity, price)
		puts ("#{quantity} #{name}: #{price}$")
	end
end


class FruitsPrice

	@fruits_stations = {apple: {spring: 10, summer: 10, autumn: 15, winter: 12},
					orange: {spring: 5, summer: 2, autumn: 5, winter: 5},
					grape: {spring: 12, summer: 15, autumn: 15, winter: 15},
					banana: {spring: 20, summer: 20, autumn: 20, winter: 21},
					watermelon: {spring: 50, summer: 50, autumn: 50, winter: 50}
			}

	def self.puts_price(fruit)
		month = Time.now.mon

		if Season.spring?(month)
			watermelon?(fruit) ? @fruits_stations[fruit][:spring]*2 : @fruits_stations[fruit][:spring]

		elsif Season.summer?(month)
			watermelon?(fruit) ? @fruits_stations[fruit][:summer]*2 : @fruits_stations[fruit][:summer]

		elsif Season.autumn?(month)
			watermelon?(fruit) ? @fruits_stations[fruit][:autumn]*2 : @fruits_stations[fruit][:autumn]

		elsif Season.winter?(month)
			watermelon?(fruit) ? @fruits_stations[fruit][:winter]*2 : @fruits_stations[fruit][:winter]
		end
	end

	private

	def self.watermelon?(fruit)
		fruit == :watermelon && Time.now.sunday?
	end

end

class Season
	def self.spring?(mon)
		[3,4,5].include?(mon)
	end

	def self.summer?(mon)
		[6,7,8].include?(mon)			
	end

	def self.autumn?(mon)
		[9,10,11].include?(mon)
	end

	def self.winter?(mon)
		[12,1,2].include?(mon)
	end
end

cart = ShoppingCart.new
cart.add_item_to_cart :apple
cart.add_item_to_cart :apple
cart.add_item_to_cart :apple
cart.add_item_to_cart :banana
cart.add_item_to_cart :banana
cart.add_item_to_cart :grape
cart.add_item_to_cart :grape
cart.add_item_to_cart :grape

cart.show
puts cart.cost

#puts FruitsPrice.puts_price(:watermelon)
