class TreeService

  attr_accessor :diameter # :circumference

  def initialize(diameter)
    @diameter = diameter
    # @circumference = circumference
  end

  def calculate_diameter
    @diameter = circumference / Math::PI
  end

  def calculate_mass
    @mass = 10 ** (-1.25 + 2.66 * Math::log(diameter)/Math::log(10))
  end

  def calculate_co2
    @co2_removed = @mass * 1.65
  end

end
