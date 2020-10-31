class Ship
  attr_reader :current_position

  def initialize
    @current_position = [5, 0] # x, y
  end

  def right
    @current_position[0] += 1
  end
end
