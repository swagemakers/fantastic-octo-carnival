<<<<<<< HEAD
require_relative "station.rb"
require_relative "trains.rb"
require_relative "route.rb"
require_relative "passenger_train.rb"
require_relative "cargo_train.rb"
require_relative "carriage.rb"
require_relative "passenger_carriage.rb"
require_relative "cargo_carriage.rb"

class Main

  def initialize
    @stations = []
    @routes = []
    @trains = []
=======
require_relative 'stationClass.rb'
require_relative 'routeClass.rb'
require_relative 'trainClass.rb'
require_relative 'PassengerTrain.rb'
require_relative 'CargoTrain.rb'
require_relative 'Carriage.rb'
require_relative 'PassengerCarriage.rb'
require_relative 'CargoCarriage.rb'

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
>>>>>>> f0878afdd5d3ab7cc7e7c016109fa12bc50ea276
  end

  def show_collection(collection)
    collection.each.with_index(1) do |item, index|
<<<<<<< HEAD
      puts "#{index} - #{item}"
    end
=======
    puts "#{index} - #{item}"
>>>>>>> f0878afdd5d3ab7cc7e7c016109fa12bc50ea276
  end

  def select_from_collection(collection)
    index = gets.to_i
    return if index.negative?
    collection[index - 1]
  end

<<<<<<< HEAD
  def run
    loop do
      show_main_menu

      case gets.to_i
      when 1 then stations_menu
      when 2 then trains_menu
      when 3 then routes_menu
      when 0 then break
      end
    end
  end

  def show_main_menu
    puts "1 – Меню станций"
    puts "2 – Меню поездов"
    puts "3 – Меню маршрутов"
    puts "0 – Выход"
  end

  def stations_menu
    loop do
      show_stations_menu

      case gets.to_i
=======
  def StationMenu
    loop do
      case
>>>>>>> f0878afdd5d3ab7cc7e7c016109fa12bc50ea276
      when 1 then create_station
      when 2 then show_stations
      when 3 then show_trains
      when 0 then break
      end
    end
  end

<<<<<<< HEAD
  def show_stations_menu
    puts "1 – Создать станцию"
    puts "2 – Список станций"
    puts "3 – Список поездов на станции"
    puts "0 – Выход"
  end

  def create_station
    puts "Введите название станции: "
    name = gets.chomp
    @stations << Station.new(name)
  end

  def show_stations
    @stations.each.with_index(1) do |station, index|
     puts "#{index} - #{station.name}"
    end
  end

  def show_trains
    show_collection(@stations)
    station = select_from_collection(@stations)
    return unless station
    station.trains.each { |train| puts train.number }
  end

  def trains_menu
    loop do
      show_trains_menu

      case gets.to_i
      when 1 then create_trains
      when 2 then manage_trains
      when 3 then move_trains
      when 0 then break
      end
   end
  end

  def show_trains_menu
    puts "1 – Создать поезда"
    puts "2 – Редактировать поезда"
    puts "3 – Перемещать поезда"
    puts "0 – Выход"
  end

  def create_trains
    puts "Введите номер поезда: "
    number = gets.to_i
    puts "Введите тип поезда (1 - пассажирский, 2 – грузовой): "
    train_type = gets.to_i
    case train_type
    when 1 then @trains << PassengerTrain.new(number)
    when 2 then @trains << CargoTrain.new(number)
    end

    @trains.each { |train| puts train.number }
  end

  def manage_trains
    show_collection(@trains)
    puts "Введите номер поезда: "
    train = select_from_collection(@trains)
    return unless train
    loop do
      show_manage_trains_menu

      case gets.to_i
      when 1 then add_carriages(train)
      when 2 then delete_carriages(train)
=======
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
>>>>>>> f0878afdd5d3ab7cc7e7c016109fa12bc50ea276
      when 0 then break
      end
    end
  end

<<<<<<< HEAD
  def show_manage_trains_menu
    puts "1 – Добавить вагоны"
    puts "2 – Удалить вагоны"
  end

  def add_carriages(train)
    if train.is_a?(PassengerTrain)
      train.add_carriages(PassengerCarriage.new)
    elsif train.is_a?(CargoTrain)
      train.add_carriages(CargoCarriage.new)
    end
  end

  def delete_carriages(train)
    show_collection(train.carriages)
    carriage = select_from_collection(train.carriages)
    return unless carriage
    train.delete_carriages(carriage)
  end

  def move_trains
    show_collection(@trains)
    puts "Выберите поезд: "
    train = select_from_collection(@trains)
    loop do
      show_transporting_menu

      case gets.to_i
      when 1 then train.move_forward
      when 2 then train.move_backwards
=======
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
>>>>>>> f0878afdd5d3ab7cc7e7c016109fa12bc50ea276
      when 0 then break
      end
    end
  end

<<<<<<< HEAD
  def show_transporting_menu
    puts "1 – Движение вперед"
    puts "2 – Движение назад"
    puts "0 – Выход"
  end

 def routes_menu
    loop do
      show_routes_menu

      case gets.to_i
      when 1 then create_routes
      when 2 then manage_routes
      when 3 then assign_route
=======
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
>>>>>>> f0878afdd5d3ab7cc7e7c016109fa12bc50ea276
      when 0 then break
      end
    end
  end

<<<<<<< HEAD
  def show_routes_menu
    puts "1 — Создать маршрут"
    puts "2 – Редактировать маршрут"
    puts "3 – Приписать маршрут поезду"
    puts "0 — Выход"
  end

  def create_routes
    show_collection(@stations)
    puts "Введите первую станцию: "
    first_station = select_from_collection(@stations)
    puts "Введите последнюю станцию: "
    last_station = select_from_collection(@stations)
    @routes << Route.new(first_station, last_station)
  end

  def manage_routes
    show_collection(@routes)
    puts "Выберите маршрут: "
    route = select_from_collection(@routes)
    return unless route
    loop do
      show_manage_routes_menu

      case gets.to_i
      when 1 then add_stations(route)
      when 2 then delete_stations(route)
=======
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
>>>>>>> f0878afdd5d3ab7cc7e7c016109fa12bc50ea276
      when 0 then break
      end
    end
  end

<<<<<<< HEAD
  def show_manage_routes_menu
    puts "1 – Добавить станцию"
    puts "2 – Удалить станцию"
    puts "0 - Выход"
  end

  def add_stations(route)
    show_collection(@stations)
    puts "Выберите станцию, которую хотите добавить: "
    station = select_from_collection(@stations)
    route.add_station(station)
  end

  def delete_stations(route)
    show_collection(route.stations)
    puts "Вберите станцию, которую хотите удалить: "
    station = select_from_collection(route.stations)
    route.delete_station(station)
  end

    def assign_route
    show_collection(@routes)
    puts "Выберите маршрут: "
    route = select_from_collection(@routes)

    show_collection(@trains)
    puts "Выберите поезд: "
    train = select_from_collection(@trains)
    train.route=route
  end
end
=======
end
      
>>>>>>> f0878afdd5d3ab7cc7e7c016109fa12bc50ea276
