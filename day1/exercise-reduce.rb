 longest_city = cities.reduce(" ") do |value, city|  
 	binding.pry                           
 	if city.length > value.length                                 
		city
	else
		value                                                     
	end                                                           
end

puts longest_city

# each
# select
# map
# reduce