module SpaceSchool
  class Ship
    attr_reader :position
    include Movements
    #extend Movements

    def initialize
      @position = [10, 5] # y, x
    end

    # protected
  end
end
