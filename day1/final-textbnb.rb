class Home
	attr_reader(:name, :city, :capacity, :price)

	def initialize(name, city, capacity, price)
		@name = name
		@city = city
		@capacity = capacity
		@price = price
	end
end

my_homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49),
  Home.new("Jose's place", "Salamanca", 2, 55),
  Home.new("Emilio's place", "Nuevos Ministerios", 2, 50),
  Home.new("Jony's place", "Madrid", 1, 50),
  Home.new("Another place", "Cadiz",4,20),
  Home.new("Home Sweet Home", "Dos Hermanas", 4, 20)
]

# Iteration 1
def display_homes_list(homes)
	homes.each do |home|
		puts " #{home.name} by #{home.price} with capacity #{home.capacity} at #{home.city}"

	end
end

display_homes_list(my_homes)

puts ("Iteration 2")
puts ("-----------")
# Iteration 2

def sort_places_by_lowest_price(homes)
	homes.sort {|x,y| x.price <=> y.price}
end

def sort_places_by_highest_price(homes)
	homes.sort {|x,y| y.price <=> x.price}
end

def sort_places_by_capacity(homes)
	homes.sort {|x,y| x.capacity <=> y.capacity}
end

def select_sorting_method(homes)
	puts "Please, select the sorting method"
	puts " push 1 sorting by price, lowest first"
	puts " push 2 sorting by price, highest first"
	puts " push 3 sorting by capacity"

	input = gets.chomp.to_i
	if input == 1
		sort_places_by_lowest_price(homes)
	elsif input == 2
		sort_places_by_highest_price(homes)
	elsif input == 3
		sort_places_by_capacity(homes)
	end
end

#display_homes_list(select_sorting_method(my_homes))



puts ("Iteration 3")
puts ("-----------")
# Iteration 3

def filter_homes_by_city(homes, city_name)
	homes.select do |home|
		home.city == city_name
	end
end

#display_homes_list( filter_homes_by_city(my_homes, "Seville") )


puts ("Iteration 4")
puts ("-----------")
# Iteration 4

def show_average_price (homes)

	prices = homes.map do |home|
		home.price
	end

	total_price = prices.reduce do |sum,price|
		sum + price
	end

	average = total_price/homes.length
end

# Iteration 5

def find_home_by_price(homes, price)
	homes.find do |home|
		home.price == price
	end
end

# User menu method

def homes_menu_options(homes)
	puts "Please, select an option"
	puts " push 1 sorting by price, lowest first"
	puts " push 2 sorting by price, highest first"
	puts " push 3 sorting by capacity"
	puts " push 4 to select a city"
	puts " push 5 to select by price"

	total_homes = []
	input = gets.chomp.to_i
	if input == 1
		total_homes = sort_places_by_lowest_price(homes)
	elsif input == 2
		total_homes = sort_places_by_highest_price(homes)
	elsif input == 3
		total_homes = sort_places_by_capacity(homes)
	elsif input == 4
		puts "Please, give a city name"
		city_name = gets.chomp
		total_homes = filter_homes_by_city(homes, city_name)
	elsif input == 5
		puts "Please, select a price to find a home"
		city_price = gets.chomp.to_i
		total_homes.push (find_home_by_price(homes, city_price) )
	end

	display_homes_list(total_homes)

	puts "The average price of your selected Homes is: "
	puts show_average_price (total_homes)
end

homes_menu_options(my_homes)

