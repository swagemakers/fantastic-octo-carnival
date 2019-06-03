# frozen_string_literal: true

require_relative 'instance_counter.rb'
require_relative 'accessors.rb'

class Route
  attr_reader :stations

  include InstanceCounter
  extend Accessors
  extend Validation

  strongly_typed_accessor :first_station, Station
  strongly_typed_accessor :last_station, Station

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    self.first_station = first_station
    self.last_station = last_station
    validate!
    register_instance
  end

  def add_station(station)
    return if @stations.include?(station)

    @stations.insert(-2, station)
  end

  def delete_station(station)
    return if [stations.first, stations.last].include?(station)

    @stations.delete(station)
  end

  def show_stations
    @stations.each { |station| puts station.name }
  end

  def to_s
    "#{stations.first} - #{stations.last}"
  end
end
