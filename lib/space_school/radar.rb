require_relative 'meteor'

class Radar

  def initialize
    @meteors = []
    5.times do
      @meteors << SpaceSchool::Meteor.new
    end
    @range = scan_space
  end


  def show
    @meteors[0].down
    @range = detect_meteor(@range)
    @range.each_index do |i|
      print @range[i]
      puts ""
    end
  end

  private

  def scan_space
    current_space = []
    (0..10).each do |i|
      current_space[i] = []
      (0..10).each do |j|
        current_space[i][j] = " - "
      end
    end
    detect_meteor(current_space)
  end

  def detect_meteor(current_space)
    @meteors.each do |meteor|
      y = meteor.position[0]
      x = meteor.position[1]
      current_space[y][x] = meteor.show
    end
    current_space
  end
end
