class Rooms
	attr_reader :exits, :description
	def initialize(name, description, exits = [], objects = [])
		@name = name
		@description = description
		@exits = exits
		@objects = objects
	end

	def exit_from_room(action)
		puts description
		unless exits.include?(action)
			puts "There is no exit there."
			exit_from_room(action)
		end
	end

end

class Game
	attr_reader :rooms
	def initialize(rooms)
		@rooms = rooms
		@init_room = rooms[Random.rand(@rooms.length)]
	end

	def start_game
		exit_from_room(@init_room)
	end

	def exit_from_room(room)
		puts room.description
		unless room.exits.include?(select_movement)
			puts "There is no exit there."
			exit_from_room(room)
		end
	end

	def select_movement
		puts "please, select a valid movement"
		print_promt
		input = gets.chomp.upcase
		unless ["N", "S","E","W"].include?(input)
			select_movement
		end
		input
	end

	def print_promt
		puts "Valid movements (N)orth, (S)outh, (E)ast, (W)estern"
		print " > "
	end

end


dark_room = Rooms.new("dark room", "You are in a dark room, find the exit!", exits = ["N"])
forest = Rooms.new("forest", "You are in a forest", exits = ["S","E"])

my_game = Game.new([dark_room, forest])
#my_game.exit_from_room(dark_room)
my_game.start_game