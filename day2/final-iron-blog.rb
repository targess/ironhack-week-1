require 'colorize'

class Blog
	def initialize(posts = [])
		@posts = posts
		@posts_per_page = 3
	end

	def add_post(post)
		@posts.push(post)
	end

	def publish_all_at_front_page
		publish_selected_posts(sort_posts)
	end

	def publish_selected_posts(posts)
		posts.each do |post|
			post.publish_post
			puts "------------".colorize(:green)
		end
	end

	def publish_paginated_front_page(page)
		number_of_pages = calculate_pages
		selected_posts = posts_from_page(page)

		publish_selected_posts(selected_posts)
		paint_pagination(page, number_of_pages)
	end

	def start_blog
		input_key = 1
		begin
			system("clear")
			publish_paginated_front_page(input_key)
			input_key = gets.chomp.to_i
		end while input_key <= calculate_pages
	end

	private

	def paint_pagination(page, number_of_pages)
		puts("")
		if page != 1 && page <= number_of_pages
			print("previous < ")
		end
		1.upto(number_of_pages) do |i|
			if i == page
				print ("#{i}".colorize(:white).on_green)
			else
				print(" #{i} ")
			end
		end
		if page == 1 || page < number_of_pages
			print("> next")	
		end
		puts("")
		puts("press destination page")
	end

	def sort_posts(posts = @posts)
		posts.sort {|x,y| x.date <=> y.date}
	end

	def calculate_pages(posts_per_page = @posts_per_page)
		(@posts.length / posts_per_page.to_f).ceil
	end

	def posts_from_page(page)
		sort_posts(@posts)[(page-1)*@posts_per_page, @posts_per_page]
	end


end

class Post
	attr_accessor :date
	def initialize(title, date, text, sponsored = false)
		@title = title
		@date = date
		@text = text
		@sponsored = sponsored
	end

	def publish_post

		sponsored_string = ""
		if @sponsored then sponsored_string = "*****" end

		puts "#{sponsored_string }TITLE: #{@title} #{sponsored_string}"
		puts "* published at: #{@date}"
		puts "#{@text}"
	end
end

first_post = Post.new("Mi primer post",Time.now.strftime("%m/%d/%Y"), "Lorem Ipsum Dolor")
second_post = Post.new("Seguimos escribiendo en el blog","10/22/2016","Lorem Ipsum Dolor")
third_post = Post.new("The Sponsored post","10/10/2016"," j0j0 j0j0", true)

posts_array = [first_post,second_post,third_post]
my_blog = Blog.new(posts_array)

my_blog.add_post(Post.new("Vamos que nos vamos","10/18/2016","Lorem Ipsum Dolor"))
my_blog.add_post(Post.new("Otro","10/19/2016","Lorem Ipsum Dolor"))
my_blog.add_post(Post.new("Siguiente!","10/16/2016","Lorem Ipsum Dolor"))
my_blog.add_post(Post.new("El último!","10/30/2016","Lorem Ipsum Dolor"))



my_blog.start_blog
