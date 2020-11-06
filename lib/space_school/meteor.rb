module SpaceSchool
  class Meteor
    attr_accessor :position
    include Movements

    def initialize
      @position = [0] # y, x
      @position << random_x
    end

    def show
      " ** "
    end

    private

    def random_x
      rand(0..10) # Limite del tablero
    end
  end
end
