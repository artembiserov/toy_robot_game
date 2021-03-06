require_relative './direction'
require_relative './board'

class Robot
  attr_reader :board, :direction, :x, :y

  def initialize(board: Board.new)
    @active = false
    @board = board
  end

  def set_to_table(x:, y:, facing:)
    raise StandardError, "Board can't be blank" if board.nil?

    direction = Direction.new(facing)
    direction.validate!
    board.validate_place!(x: x, y: y)

    @x = x
    @y = y
    @direction = direction
    @active = true
  end

  def move
    validate_active

    new_x, new_y = x, y

    case
    when direction.north?
      new_y += 1
    when direction.south?
      new_y -= 1
    when direction.west?
      new_x -= 1
    when direction.east?
      new_x += 1
    end
    board.validate_place!(x: new_x, y: new_y)

    @x, @y = new_x, new_y
  end

  def turn_left
    validate_active

    direction.turn_left
  end

  def turn_right
    validate_active

    direction.turn_right
  end

  def location
    [x, y, facing]
  end

  def show_report
    puts location.join(',')
  end

  def active?
    @active
  end

  def facing
    direction.facing
  end

  private

  def validate_active
    raise StandardError, 'Robot is not active' unless active?
  end
end
