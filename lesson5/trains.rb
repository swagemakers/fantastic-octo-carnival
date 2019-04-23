class Train
  attr_reader :speed, :type, :carriages, :number

  @@all = {}

  def self.find(number)
    @@all[number]
  end

  end

  def initialize(number, type)
    @number = number
    @carriages = []
    @speed = 0
    @type = type
    @@all[number] = self
  end

  def stop
    @speed = 0 #train doesn't move
  end

  def increase_speed(speed = 5)
    @speed += speed #speeds the train uo to 5
  end

  def add_carriages(carriage)
    if attachable_carriage?(carriage)
      @carriages << Carriage.new#adds a new carriage to the train if it doesn't move
    end
  end

  def delete_carriages(carriage)
    carriages.delete(carriage) #deletes a carriage from the train if it doesn't move and the number of carriages is not 0
  end

  def route=(value)
    @route = value
    @current_station = 0
    @route.stations[@current_station].add_train(self)
  end

  def current_station
    return unless @route
    @route.stations[@current_station]
  end

  def next_station
    return unless @route
    @route.stations[@current_station + 1]
  end

  def previous_station
    return unless @route
    @route.stations[@current_station - 1] if @current_station.positive?
  end

  def move_forward
    return unless next_station
    current_station.remove_train(self)
    @current_station += 1
    current_station.add_train(self)
  end

  def move_backwards
   return unless previous_station
   current_station.remove_train(self)
   @current_station -= 1
   current_station.add_train(self)
  end

  def to_s
    number
  end
end