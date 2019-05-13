require_relative "instance_counter.rb"

class Train

  REQUIRES_TYPE = "У поезда должен быть тип"
  NUMBER_FORM= /^[а-я0-9]{3}-?[а-я0-9]{2}$/i #три буквы или цифры, возможно тире, две буквы или цифры
  NUMBER_FORM_WRONG = "Неверный формат номера"

  attr_reader :speed, :type, :carriages, :number

  @@all = {}

  include InstanceCounter

  def self.find(number)
    @@all[number]
  end

  def initialize(number, type)
    @number = number
    @carriages = []
    @speed = 0
    @type = type
    validate!
    @@all[number] = self
    register_instance
  end

  def stop
    @speed = 0 #train doesn't move
  end

  def increase_speed(speed = 5)
    @speed += speed #speeds the train uo to 5
  end

  def add_carriage(carriage)
  return unless speed.zero?
  return unless attachable_carriage?(carriage)
    @carriages << carriage
  end

  def delete_carriages(carriage)
    @carriages.delete(carriage) #deletes a carriage from the train if it doesn't move and the number of carriages is not 0
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

  def valid?
    validate!
    true
  rescue
    false
  end

  protected

  def validate!
    raise ArgumentError, NUMBER_FORM_WRONG if @number !~ NUMBER_FORM
    raise ArgumentError, REQUIRES_TYPE if @type.nil?
  end
end
