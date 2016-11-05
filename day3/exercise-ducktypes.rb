class WheelCounter
	def self.count_wheels(vehicles)
		vehicles.reduce(0) do |sum, item|
			sum + item.wheels
		end
	end
end

class NoiserPrinter
	def self.print_noise(vehicles)
		vehicles.reduce("") do |sum, item|
			sum + item.noise
		end
	end
end

class Car
	attr_reader :noise, :wheels
	def initialize
		@wheels = 4
		@noise = "Brrrmmm"
	end
end

class PedroPicapiedra
	attr_reader :noise, :wheels
	def initialize
		@wheels = 0
		@noise = "Meek Meeek"
	end
end

class Moto
	attr_reader :noise, :wheels
	def initialize
		@wheels = 2
		@noise = "bbruum brrummm"
	end
end


vehicles_array = [Car.new, PedroPicapiedra.new, Moto.new]

puts WheelCounter.count_wheels(vehicles_array)
puts NoiserPrinter.print_noise(vehicles_array)