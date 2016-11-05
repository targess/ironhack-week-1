class Car
	def initialize(engine)
		@engine = engine
		@noise = "track track track"
	end

	def make_noise
		@noise + @engine.make_noise
	end
end

class Engine
	def initialize	
		@noise = "Bratatata"
	end	

	def make_noise
		@noise
	end
end

class AdvancedEngine < Engine
	def make_noise
		@noise = "Brrrmmmm"	
	end
end

class ClassicEngine < Engine
	def make_noise
		@noise = "tiri tiri tiri"
	end
end

basic_engine = Engine.new
advanced_engine = AdvancedEngine.new

#my_car = Car.new(basic_engine)
my_car = Car.new(advanced_engine)
puts my_car.make_noise