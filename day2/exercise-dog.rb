class Dog
	attr_accessor :name, :breed
	attr_writer :sound
	# saved people smelled in an array
#	attr_reader :people_smelled

	def initialize (name, breed, sound = "Woof")
		@name = name
		@breed = breed
		@sound = sound
		@@number_of_dogs ||= 0
		@@number_of_dogs += 1 
		@people_smelled = []
	end

	def bark
		puts @sound
	end

	def track
		puts "Sniff"
	end

	def self.number_of_dogs
		puts @@number_of_dogs
	end

	def smell(person)
		# saved people smelled in an array
		#@people_smelled.push(person)

		# saved people smelled in a file
		file = File.open(@name+".txt", "a")
		file.puts person
		file.close
	end

	# saved people smelled in a file
	def people_smelled
		file = File.open(@name+".txt","r")
		people = file.readlines
		file.close
		people
	end

	# def tell_smelled_people
	# 	@people_smelled.each do |person|
	# 		puts "#{person} was smelled by #{@name}"
	# 	end
	# end
end


class Hound < Dog

	def initialize (name, breed, sound, animal)
		super(name, breed, sound)
		@animal = animal
	end

	def roll
		puts "Roll... Roll... Roll..."
	end

	def track
		puts "Sniffff... Sniffff... Sniffff..."
		super
	end
end

class PetDog < Dog

	attr_accessor :owner

	def initialize (name, breed, sound, owner)
		super(name, breed, sound)
		@owner = owner
	end

	def fetch (toy)
		puts "the dog fetch to #{@owner} the #{toy} and say:"
		bark
		bark
		bark
#		puts "the dog fetch to #{@owner} the #{toy} and say #{bark} #{bark} #{bark}"

	end
end

my_dog = Dog.new("Lolo", "Bod")
my_dog.track

my_dog.smell("Emilio")
my_dog.smell("Jony")
my_dog.smell("Santi")

puts my_dog.people_smelled