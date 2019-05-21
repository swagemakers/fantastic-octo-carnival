# frozen_string_literal: true

module Manufacturer
  attr_accessor :manufacturer

  def manufacturer(name)
    @manufacturer = name
  end
end
