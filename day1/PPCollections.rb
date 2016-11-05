class ProgramingLanguange #creamos la clase ProgrammingLanguage
	attr_accessor :name, :age, :type #llamar a la variable desde fuera
	def initialize(name, age, type) #tipos de variable
		@name = name
		@age = age
		@type = type
	end

end

#creamos objetos de la clase programminglanguage
ruby = ProgramingLanguange.new("Ruby",21,"Dynamic")
python = ProgramingLanguange.new("Python",24,"Dynamic")
javascript = ProgramingLanguange.new("JavaScript",20,"Dynamic")
go = ProgramingLanguange.new("Go",6,"Static")
rust = ProgramingLanguange.new("Rust",5,"Static")
swift = ProgramingLanguange.new("Swift",2,"Static")
java = ProgramingLanguange.new("Java",20,"Static")

#creamos array con los objetos
array_of_languages = [ruby, python, javascript, go, rust, swift, java]

#imprime en pantalla cada elemento del array
def array_printer(array) #def son funciones/metodos
	array.each do |language| #metodo each
		puts "Language: #{language.name} | Age: #{language.age} | Type System #{language.type}"
	end
	
end

#el metodo array_printer imprimre al array que llamemos (en este caso array_of_languages)
array_printer(array_of_languages)


aged_languages = array_of_languages.map do |language|
	language.age += 1
	if language.name == "Ruby"
		language.name = "Ruby2"
	end
	language
end

array_printer (aged_languages)


sorted_languages = array_of_languages.sort { |x,y| y.age <=> x.age }

array_printer(sorted_languages)

puts " ------------ "
array_of_languages.delete_at(6)
array_printer(array_of_languages)

#array_of_languages.delete_if {|language| language.name == "Rust" }
#puts " ------------ "
#array_printer(array_of_languages)
puts " ------------ "

shuffled_languages = sorted_languages.shuffle

array_printer(shuffled_languages)

count_languages = array_of_languages.count

puts count_languages

puts " ------------ "

selected_languages = array_of_languages.select { |language| language.type == "Dynamic"}

array_printer(selected_languages)


