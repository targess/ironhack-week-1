require("pry")

class Main

	def start
		my_board = load_board
		my_moves = load_moves

		my_moves.each do |move|
			init_position = move[0]
			init_coordinates = BoardTranslator.get_coordinates(init_position)
			x = init_coordinates[0]
			y = init_coordinates[1]

			final_position = move[1]
			final_coordinates = BoardTranslator.get_coordinates(final_position)
			x_final = final_coordinates[0]
			y_final = final_coordinates[1]

			if my_board[x][y]
				if my_board[x][y].valid_movement?(init_position,final_position)

					if my_board[x_final][y_final] == nil
						#puts "LEGAL"
						puts "Legal"
					else
						#puts "ILEGAL - Destination Occupied"
						puts "Destination Occupied"
					end
				else
					#puts "ILEGAL"
					puts "Illegal"
				end
			else
				#puts "ILEGAL - Empty Position"
				puts "Empty Position"
			end

		end
	end

	def load_moves(filename = "complex_moves.txt")
		moves = IO.readlines(filename)
		moves.map do |move|
			move.split(" ")
		end
	end

	def load_board(filename = "complex_board.txt")
			board = IO.readlines(filename)
		board.map! do |file|
			file.split(" ")
		end
		board
		put_pieces_on_board(board)
	end

	def put_pieces_on_board(board)
		0.upto(7) do |x|
			0.upto(7) do |y|
				if board[x][y] == "--"
					board[x][y] = nil
				else
					piece = board[x][y]
					letter = piece[-1,1]
					color = piece [0,1]
					position = BoardTranslator.get_position(x,y)


					board[x][y] = get_object_piece(letter,color,position)
				end
			end
		end

		board


		# board.map! do |file|
		# 	file.map! do |square|
		# 		if square == "--"
		# 			nil
		# 		else
		# 			letter = square[-1, 1]
		# 			get_object_piece(letter)
		# 		end
		# 	end
		# end
	end

	def get_object_piece(letter, color, position)
		case letter
			when "K"
				piece = Kings.new(position, color)
			when "Q"
				piece = Queens.new(position, color)
			when "R"
				piece = Rooks.new(position, color)
			when "B"
				piece = Bishops.new(position, color)
			when "N"
			piece = Knights.new(position, color)
			when "P"
				piece = Pawns.new(position, color)
		end
		piece.get_movements
		piece
	end
end

# string.chr #returns first character (color on board)


class BoardTranslator

	def self.get_coordinates(position)
		board_positions
		coordinates = []
		@board_positions.each_index do |x|
			y = @board_positions[x].index(position)
			if y
				coordinates = [x, y]
			end
		end
		coordinates
	end

	def self.get_position(pos_x, pos_y)
		board_positions
		@board_positions[pos_x][pos_y]
	end

	def self.board_positions
		@board_positions = [
		["a8", "b8", "c8", "d8", "e8", "f8", "g8", "h8"], #0
		["a7", "b7", "c7", "d7", "e7", "f7", "g7", "h7"], #1
		["a6", "b6", "c6", "d6", "e6", "f6", "g6", "h6"], #2
		["a5", "b5", "c5", "d5", "e5", "f5", "g5", "h5"], #3
		["a4", "b4", "c4", "d4", "e4", "f4", "g4", "h4"], #4
		["a3", "b3", "c3", "d3", "e3", "f3", "g3", "h3"], #5
		["a2", "b2", "c2", "d2", "e2", "f2", "g2", "h2"], #6
		["a1", "b1", "c1", "d1", "e1", "f1", "g1", "h1"]  #7
		]
	end

end

class Pieces

	def initialize(position, color)
		@movements = []
		@position = position
		@color = color
		@coordinates = BoardTranslator.get_coordinates(position)	
	end

	def valid_movement?(init_position,final_position)
		final_coord = BoardTranslator.get_coordinates(final_position)
		get_movements(init_position).include?(final_coord)
	end

	def get_movements(position = @position)

	end

	def eat(initial,final)
		false
	end

	def ortogonal_movement(position = @position)
		8.times do |i|
			@movements.push([@coordinates[0], i])
			@movements.push([i, @coordinates[1]])
		end
		@movements.delete(@coordinates)
		return @movements
	end

	def diagonal_movement(position = @position)
		y = 0
		@coordinates[0].upto(7) do |x|
			@movements.push([x,@coordinates[1]+y])
			@movements.push([x,@coordinates[1]-y])
			y += 1
		end

		y = 0
		@coordinates[0].downto(0) do |x|
			@movements.push([x,@coordinates[1]-y])
			@movements.push([x,@coordinates[1]+y])
			y += 1
		end

		@movements.delete(@coordinates)
		return @movements
	
	end
end

class Pawns < Pieces

	def get_movements(position = @position)

		if @color == "w"
			if @coordinates[0] == 6
				@movements.push([@coordinates[0] -2, @coordinates[1]])
			end
			@movements.push([@coordinates[0] - 1, @coordinates[1]])
		elsif @color == "b"
			if @coordinates[0] == 1
				@movements.push([@coordinates[0] +2, @coordinates[1]])
			end
			@movements.push([@coordinates[0] + 1, @coordinates[1]])
		end
	end

end

class Rooks < Pieces

	def get_movements(position = @position)
		ortogonal_movement(position)
	end
end

class Kings < Pieces
	def get_movements(position = @position)
		@movements.push([@coordinates[0]-1,@coordinates[1]])
		@movements.push([@coordinates[0]+1,@coordinates[1]])
		@movements.push([@coordinates[0],@coordinates[1]+1])
		@movements.push([@coordinates[0],@coordinates[1]-1])

		@movements.push([@coordinates[0]-1,@coordinates[1]-1])
		@movements.push([@coordinates[0]+1,@coordinates[1]+1])
		@movements.push([@coordinates[0]-1,@coordinates[1]+1])
		@movements.push([@coordinates[0]+1,@coordinates[1]-1])
	end
end

class Bishops < Pieces
	def get_movements(position = @position)
		diagonal_movement(position)
	end
end

class Knights < Pieces
	def get_movements(position = @position)		

		x = @coordinates[0]
		y = @coordinates[1]

		@movements.push([x-2,y-1])
		@movements.push([x-2,y+1])

		@movements.push([x+2,y-1])
		@movements.push([x+2,y+1])

		@movements.push([x-1,y-2])
		@movements.push([x+1,y-2])

		@movements.push([x-1,y-2])
		@movements.push([x+1,y+2])

	end
end

class Queens < Pieces
	def get_movements(position = @position)
		ortogonal_movement(position).concat diagonal_movement(position)
	end

end

simple_board = [
["bR", "bN", "bB", "bQ", "bK", "bB", "bN", "bR"],
["bP", "bP", "bP", "bP", "bP", "bP", "bP", "bP"],
["--", "--", "--", "--", "--", "--", "--", "--"],
["--", "--", "--", "--", "--", "--", "--", "--"],
["--", "--", "--", "--", "--", "--", "--", "--"],
["--", "--", "--", "--", "--", "--", "--", "--"],
["wP", "wP", "wP", "wP", "wP", "wP", "wP", "wP"],
["wR", "wN", "wB", "wQ", "wK", "wB", "wN", "wR"]]

my_pawn = Pawns.new("d5","b")
my_rook = Rooks.new("d5","b")
my_king = Kings.new("d5","b")
my_bishop = Bishops.new("d5","b")
my_knight = Knights.new("d5","b")
my_queen = Queens.new("d5","b")

main = Main.new
binding.pry
