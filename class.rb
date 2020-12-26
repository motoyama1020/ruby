class Car
  def initialize(car_name, car_model, capacity)
    @name = car_name
    @model = car_model
    @capacity = capacity
  end

  def self.run
    puts "走行します"
  end

  def ride_car(ride_number)
    @ride_number = ride_number
    if ride_number > ride_number
      puts "#{@name}は、乗車定員が#{@capacity}人なので、#{@ride_number}人は乗れません。"
    else
      puts "#{@ride_number}人乗車できました。"
    end
  end
end

fire_truck = Car.new ("消防車","大型車",5)
fire_truck.ride_car(3)
Car.run


class Human
  def hello
    puts "おはよう"
  end
end

person = Human.new
person.hello

hello

Human.hello

human = Human.new
human.hello
