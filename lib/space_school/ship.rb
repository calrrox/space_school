class Ship
  attr_reader :current_position

  def initialize
    @current_position = [5, 0]
  end

  def left
    @current_position[0] -= 1
  end
end
