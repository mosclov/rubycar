# defines vehicle class
class Vehicle
  # initializes a vehicle
  def initialize(year, hi)
    @year = year
    @lights_on = false
    puts "Creating a new " + @year.to_s + ' ' + self.class.to_s
  end


  # returns the car's year
  def year
    @year
  end

  def toggle_lights
    @lights_on = !@lights_on
  end

  # Purpose: turns a vehicle's lights on or off
  # Signature: true/false --> nothing
  # Examples
  # vehicle.lights_on = true --> nothing
  # vehicle.lights_on = false --> nothing
  def lights_on=(input)
    if input == true || input == false
      @lights_on = input
    else
      puts 'Error: needs true or false'
    end
  end

  # Purpose: says if a vehicle's lights are on or off
  # Signature: nothing --> true/false
  # Example:
  # vehicle.lights_on? --> true/false
  def lights_on?
    if @lights_on == true
      puts "Your " + @year.to_s + ' ' + self.class.to_s + "\'s lights are on"
    else
      puts "Your " + @year.to_s + ' ' + self.class.to_s + "\'s lights are off"
    end
  end
end # end of Vehicle class

# defines Car class
class Car < Vehicle
  # initalizes the car
  def initialize(year, hi)
    super hi, year
    @wheels = 4
    @speed = 0
  end

  # returns how many wheels the car has
  def wheels
    @wheels
  end

  def speed
    @speed
  end

  def accelerate_by amount
    @speed += amount
  end

  def brake_by amount
    if @speed >= amount
      @speed -= amount
    else
      @speed = 0
    end
  end
end # end of Car class

# defines Tesla class
class Tesla < Car
  def accelerate
    accelerate_by 10
  end

  def brake
    brake_by 10
  end
end

# defines Tata class
class Tata < Car
  def accelerate
    @speed += 2
  end

  def brake
    if @speed >= 1.25
      @speed -= 1.25
    else
      @speed = 0
    end
    @speed
  end
end

# defines Toyota class
class Toyota < Car
  def accelerate
    @speed += 7
  end

  def brake
    if @speed >= 5
      @speed -= 5
    else
      @speed = 0
    end
    @speed
  end
end

collection = [Toyota.new(2001, 1), #Toyota.new(2005), Tesla.new(2015),
              #Tesla.new(2014), Tata.new(1980), Tata.new(1987),
              Vehicle.new(2002, 2)]

puts 'Collection'
puts collection.map { |e| e.year.to_s + ' ' + e.class.to_s }

puts 'Collection sorted by year'
puts collection.sort_by { |e| e.year }.map { |e| e.year.to_s + ' ' + e.class.to_s }

puts 'Collection sorted by make'
puts collection.sort_by { |e| e.class.to_s }.map { |e| e.year.to_s + ' ' + e.class.to_s }

puts 'Collection sorted by make, then year'
puts collection.sort_by { |e| e.year }.sort_by { |e| e.class.to_s }.map { |e| e.year.to_s + ' ' + e.class.to_s }

# vehicle = Vehicle.new(1990)
# p vehicle.lights_on? # should return false
# vehicle.lights_on = true
# p vehicle.lights_on? # should return true
# vehicle.lights_on = false
# p vehicle.lights_on? # should return false
#
# myTesla = Tesla.new(2013)
# myTesla.accelerate
# p myTesla.speed
# myTesla.lights_on?
