class CarDealer
	
	def initialize(cars = {})
		@cars = cars
	end

	def cars(brand)
		@cars[brand.to_sym]
	end

	def add_car(brand, car)
		@cars[brand.to_sym] ||= []
		@cars[brand.to_sym].push(car)

		# if @cars.key?(brand.to_sym)
		# 	@cars[brand.to_sym].push(car)
		# else
		# 	@cars[brand.to_sym] = [car]
		# end
	end

	def list_cars
		@cars.each do |brand, cars|
			cars(brand)
		end
	end

	def print_cars
		@cars.each do |brand, cars|
			print brand.to_s + ": "
			puts cars(brand).join(", ")
		end
	end
end

my_cars = {
	Ford: ["Fiesta", "Mustang"],
	Honda: ["Civic","CR-V"],
	Seat: ["Leon", "Ibiza"],
	WV: ["Golf"]
}

the_car_dealer = CarDealer.new(my_cars)

the_car_dealer.add_car("Audi","A4")

#puts the_car_dealer.cars("Audi")

the_car_dealer.print_cars
