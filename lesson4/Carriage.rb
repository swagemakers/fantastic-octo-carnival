class Carriage

  attr_reader :train

  def initialize
    @attached = false
  end

  def attached?
    @attached = false
  end

  def attached!
    @attached = true
  end

  def unattached
    @attached = false
  end
end