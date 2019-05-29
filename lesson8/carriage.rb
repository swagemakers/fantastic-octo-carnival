# frozen_string_literal: true

class Carriage
  NOT_ENOUGH_SPACE = 'Недостаточно свободного места'

  attr_reader :total_space

  extend Accessors

  accessor_with_history :occupied_space

  def initialize(total_space)
    @total_space = total_space
    self.occupied_space = 0
  end

  def occupy_space(value)
    raise NOT_ENOUGH_SPACE if value > available_space

    self.occupied_space += value
  end

  def available_space
    @total_space - occupied_space
  end
end
