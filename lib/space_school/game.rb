# La librería utils maneja el control de input del usuario.
# Esto permite que la captura del input no detenga el juego mientras espera respuesta.
require_relative 'utils'
require_relative 'movements'
require_relative 'radar'
require_relative 'ship'

class Game
  def self.start
    game = Game.new
    game.update
  end

  def initialize
    @frames = 0
    @fps = 10 # cantidad de frames por segundo
    @radar = Radar.new
    @ship = SpaceSchool::Ship.new
  end

  def update
    loop do
      @frames += 1 # Cantidad de frame desde que el juego comenzó (puede ser útil... o ¡no!)
      draw
      handle_input # manejo de la la entrada del jugador
      sleep 5.0 / @fps # tiempo de refrescamiento
    end
  end

  def handle_input
    key = Utils.get_key&.chr # Se captura la entrada de jugador
    case key
    when 'a'
      # mover nave a la izquierda :left
      @ship.left
    when 'd'
      # mover nave a la derecha
      @ship.right
    when 'x'
      game_over
    end
  end

  def game_over
    system 'clear'
    puts "¡Perdiste!"
    raise StopIteration
  end

  def draw
    system 'clear'
    puts "Frames: #{@frames}"
    @radar.show
    show_menu
  end

  # Propuesta de menú
  def show_menu
    puts '##################################'
    puts 'd: derecha, a: izquierda, x: salir'
    puts '##################################'
  end
end