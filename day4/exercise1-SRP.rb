class Auth
	def initialize(username,password)
		@username = username
		@password = password
		@data = {username: "jose", password: "hola_caracola"}
	end

	def authenticate
		true if @username == @data[:username] && @password == @data[:password]
	end

	def self.authenticate(username, password)
#		true if username == @data[:username] && password == @data[:password]
		true if username == "jose" && password == "hola_caracola"
	end
end

class Count
	def self.count_words(string)
		string.split(" ").size
	end

	def self.count_letters(string)
		string.size
	end
end

class Convert
	def self.to_up(string)
		string.upcase
	end

	def self.to_low(string)
		string.downcase
	end
end

class Reverse
	def self.do(string)
		string.reverse
	end
end

class Input

	def self.get_text
		puts "Enter a message: "
		gets.chomp
	end
end

class Main
	def initialize
		@jose = Auth.new("jose","hola_caracola")
	end

	def start
		if User.new.login #@jose.authenticate
			print_menu
			input = gets.chomp.to_i
			string = Input.get_text
			puts select_option(input, string)
		end
	end

	def print_menu
		puts "Select option"
		puts "1 - count words"
		puts "2 - count letters"
		puts "3 - reverse text"
		puts "4 - convert to uppercase"
		puts "5 - convert to lowercase"
	end

	def select_option(input, string)
		case input
		when 1
			Count.count_words(string)
		when 2
			Count.count_letters(string)
		when 3
			Reverse.do(string)
		when 4
			Convert.to_up(string)
		when 5
			Convert.to_low(string)
		end
	end
end

class User
	def login
		puts "enter username"
		username = gets.chomp
		puts "enter password"
		password = gets.chomp
		while !Auth.authenticate(username,password)
			puts "Incorrect password"
			puts "enter username"
			username = gets.chomp
			puts "enter password"
			password = gets.chomp
		end
		true
	end
end

#my_user = User.new.login

 my_program = Main.new
 my_program.start