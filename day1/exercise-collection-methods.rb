class Home
	attr_reader(:name, :city, :capacity, :price)

	def initialize(name, city, capacity, price)
		@name = name
		@city = city
		@capacity = capacity
		@price = price
	end
end

homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49)
]

# for	pos in 0..100
# 	puts homes[pos].name
# end


# hm = Home.new("Nizar's place", "San Juan", 2, 42)
# puts hm.name


# Exercise: each
homes.each do |hm|
	puts "#{hm.name} in #{hm.city}"
	puts "Price: $#{hm.price} a night"
	puts ""
end

cities = []

homes.each do |hm|
	cities.push(hm.city)
end

puts cities

cities = homes.map do |hm|
	hm.city
end
puts cities

#Exercise: average
prices = homes.map do |hm|
	hm.price
end

total_price = prices.reduce do |sum,price|
	sum + price
end

average = total_price/prices.length

puts "The average price is #{average}"

# ----------- Reduce

total_capacities = 0.0

homes.each do |hm|
	total_capacities = total_capacities + hm.capacity
end

puts "The average capacity is:"
puts total_capacities / homes.length

total_capacities = homes.reduce(0.0) do |sum, hm|
	sum + hm.capacity
end

puts "The average capacity is:"
puts total_capacities /homes.length

#Exercise: reduce

# Just done in exercise average

# -------- Other interesting collection methods

homes.each_with_index do |hm,index|
	puts "Home Number #{index + 1}: #{hm.name}"
end

san_juan_homes = homes.select do |hm|
	hm.city == "San Juan"
end

san_juan_homes.each {|hm| puts hm.name}

home_41_dollars = homes.find do |hm|
	hm.price == 41
end

puts "The first home that costs ¢41 is:"
puts home_41_dollars.name

sorted_homes = homes.sort do |home1, home2|
	home1.capacity <=> home2.capacity
end
