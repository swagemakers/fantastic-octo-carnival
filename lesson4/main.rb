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
  end

  def show_collection(collection)
    collection.each.with_index(1) do |item, index|
      puts "#{index} - #{item.to_s}"
    end
  end

  def select_from_collection(collection)
    index = gets.to_i
    return if index.negative?
    collection[index - 1]
  end

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
<<<<<<< HEAD
=======
        
  private
>>>>>>> f0878afdd5d3ab7cc7e7c016109fa12bc50ea276

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
      when 1 then create_station
      when 2 then show_stations
      when 3 then show_station_trains
      when 0 then break
      end
    end
  end

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
    show_collection(@stations)
  end

  def show_station_trains
    show_collection(@stations)
    station = select_from_collection(@stations)
    return unless station
    station.trains.each { |train| puts train.number }
  end

  def trains_menu
    loop do
      show_trains_menu

      case gets.to_i
      when 1 then create_train
      when 2 then manage_trains
      when 3 then move_train
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

  def create_train
    puts "Введите номер поезда: "
    number = gets.to_i
    puts "Введите тип поезда (1 - пассажирский, 2 – грузовой): "
    train_type = gets.to_i
    case train_type
    when 1 then @trains << PassengerTrain.new(number)
    when 2 then @trains << CargoTrain.new(number)
    end
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
      when 0 then break
      end
    end
  end

  def show_manage_trains_menu
    puts "1 – Добавить вагоны"
    puts "2 – Удалить вагоны"
    puts "0 – Выход"
  end

  def add_carriages(train)
    if train.is_a?(PassengerTrain) && train.speed == 0
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

  def move_train
    show_collection(@trains)
    puts "Выберите поезд: "
    train = select_from_collection(@trains)
    loop do
      show_transporting_menu

      case gets.to_i
      when 1 then train.move_forward
      when 2 then train.move_backwards
      when 0 then break
      end
    end
  end

  def show_transporting_menu
    puts "1 – Движение вперед"
    puts "2 – Движение назад"
    puts "0 – Выход"
  end

<<<<<<< HEAD
 def routes_menu
=======
  def routes_menu
>>>>>>> f0878afdd5d3ab7cc7e7c016109fa12bc50ea276
    loop do
      show_routes_menu

      case gets.to_i
      when 1 then create_routes
      when 2 then manage_routes
      when 3 then assign_route
      when 0 then break
      end
    end
  end

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
      when 0 then break
      end
    end
  end

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
