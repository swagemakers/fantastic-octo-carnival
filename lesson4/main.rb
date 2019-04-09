require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'train.rb'
require_relative 'passenger_train.rb'
require_relative 'cargo_train.rb'
require_relative 'carriage.rb'
require_relative 'passenger_carriage.rb'
require_relative 'cargo_carriage.rb'

class Main
  def menu
    loop do
      case
      when 1 then StationMenu
      when 2 then RouteMenu
      when 3 then TrainMenu
      when 0 then break
      end
    end
  end

  def show_collection(collection)
    collection.each.with_index(1) do |item, index|
    puts "#{index} - #{item}"
  end

  def select_from_collection(collection)
    index = gets.to_i
    return if index.negative?
    collection[index - 1]
  end

  def StationMenu
    loop do
      case
      when 1 then create_station
      when 2 then show_stations
      when 3 then show_trains
      when 0 then break
      end
    end
  end

  def create_station
    puts "Введите название станции: "
    name = gets.chomp
    Station.new(name)
  end

  def show_stations
    @stations.each { |station| puts station.name }
  end

  def show_trains(name)
    @trains.each { |train| puts trains.number }
  end

  def RouteMenu
    loop do
      case
      when 1 then create_route
      when 2 then manage_route
      when 3 then assign_route
      when 0 then break
      end
    end
  end

  def create_route (first_station, last_station)
      @stations = [first_station, last_station]
  end

  def manage_route
    show_collection(@routes)
    route = select_from_collection(@routes)
    puts "Введите номер маршрута: "
    loop do
      case index = gets.to_i
      when 1 then add_station(@route)
      when 2 then remove_staion(@route)
      when 0 then break
      end
    end
  end

  def add_station
    @stations.insert(-2, station)
  end

  def delete_station
    return if [stations.first, stations.last].include?(station)
    @stations.delete(station)
  end

  def assign_route
    @route = index
    @current_station = 0
    @route.stations[@current_station].add_train(self)
  end

  def TrainMenu
    loop do
      case
      when 1 then create_train
      when 2 then manage_train
      when 3 then move_train
      when 0 then break
      end
    end
  end

  def add_train
    puts "Введите номер поезда: "
    number = gets.to_i
    puts "Выберите тип поезда: "
    case
    when 1 then PassengerTrain.new(number)
    when 2 then CargoTrain.new(number)
    when 0 then break
    end
  end

  def manage_train
    show.collection(@trains)
    train = select_from_collection(@trains)
    puts "Введите номер поезда: "
    loop do
      case index = gets.to_i
      when 1 then add_carriage
      when 2 then delete_carriage
      when 0 then break
      end
    end
  end

  def add_carriage
    @carriages += 1 if @speed == 0
  end

  def delete_carriage
    @carriages -= 1 if @speed = 0 && @carriages != 0
  end

  def move_train
    show.collection(@trains)
    train = select_from_collection(@trains)
    puts "Введите номер поезда: "
    loop do
      case index = gets.to_i
      when 1 then move_forward
      when 2 then move_backwards
      when 0 then break
      end
    end
  end

end
      
