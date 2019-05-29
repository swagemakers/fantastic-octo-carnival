# frozen_string_literal: true

require_relative 'instance_counter.rb'
require_relative 'accessors.rb'
require_relative 'validation.rb'

class Station
  attr_reader :trains, :name

  REQUIRES_NAME = 'У станции должно быть название'

  @@all = []

  include InstanceCounter
  extend Accessors
  extend Validation

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@all << self
    register_instance
  end

  def add_train(train)
    @trains << train
  end

  def remove_train(train)
    @trains.delete(train)
  end

  def trains_types(type)
    @trains.select { |train| train.type == type }
  end

  def each_train
    trains.each { |train| yield(train) }
  end

  def to_s
    name
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end
end
