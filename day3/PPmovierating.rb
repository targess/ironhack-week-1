require "imdb"

class Reader
	def self.read(file)
		IO.readlines(file)
	end
end

class ImdbExtract

	def self.get_rating(film)
		search(film).movies[0].rating.round
	end

	def self.search(film)
		Imdb::Search.new(film)
	end
end

class ImdbGraph
	def initialize(file)
		@file = file
		@films_ratings = []
		@films = []
	end

	def get_ratings
		@films.each do |film|
			@films_ratings.push(ImdbExtract.get_rating(film))
		end 
		@films_ratings
	end

	def get_films
		@films = Reader.read(@file)
	end

	def print_films
		10.downto(1) do |i| 
			@films_ratings.each do |rating|
				if i <= rating
					print "|#|"
				elsif 
					print "| |"
				end
			end
			puts ""
		end
		@films.each do |film|
			puts film
		end
	end
end



my_imdb = ImdbGraph.new("movies.txt")
my_imdb.get_films
my_imdb.get_ratings
my_imdb.print_films



