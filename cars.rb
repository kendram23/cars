class Car

	@@total_car_count = 0
	@@cars_per_color = {}


	def self.total_car_count                       # This is method that belongs to the Car class itself
		@@total_car_count
	end

	def self.cars_per_color
		puts "you have #{@@cars_per_color} cars"
	end

	def self.most_popular_color
        colors_by_popularity = @@cars_per_color.sort_by {|color, amount| amount}
        # most_popular = colors_by_popularity[-1]
    end


	def to_s()
		"I'm a car! I've driven #{@distance} and have #{@fuel} gallons gas left"
	end

	def initialize(color)

		@fuel = 10
		@distance = 0
		@@total_car_count += 1
		@color=color
		if @@cars_per_color.has_key?(color)
			@@cars_per_color[color] += 1
		else  
			@@cars_per_color[color] = 1
		end
	end

	def drive(miles)
		if (@fuel - miles/20.0) >= 0
			@distance += miles
			@fuel -= miles/20.0
		else
			@distance += @fuel * 20.0
			@fuel = 0
			puts "You're out of gas!"
		end
	end

	def fuel_up()
		gallons_needed = 10.0 - @fuel
		puts "You must pay $#{3.5 * gallons_needed}"
		@fuel = 10.0
	end

end

hash={}
hash["red"]=32
puts hash

car_a = Car.new("red")
car_b = Car.new("blue")
puts car_a
puts car_b
car_a.drive(10)
puts car_a
puts car_b
car_a.drive(232)
car_b.drive(117)
puts car_a
puts car_b
puts Car.total_car_count
c1 = Car.new("red")
puts Car.total_car_count
c2 = Car.new("black")
puts Car.total_car_count

# 1 - Class method on instance
# c = Car.new
# c.total_car_count

# # 2 - Class method on class
# Car.total_car_count

# # 3 - Instance method on class
# Car.drive(10)

# 4 - Instance method on instance
c = Car.new("red")
c.drive(10)
puts "_______________________"
puts Car.most_popular_color
puts Car.cars_per_color