require_relative './direction'

class Robot
  attr_reader :board, :direction
  attr_accessor :x, :y

  def initialize(board: nil)
    @active = false
    @board = board
  end

  def add_to_board(board)
    raise ArgumentError unless board.is_a?(Board)
    @board = board
  end

  def set_to_table(x:, y:, facing:)
    raise StandardError, "Board can't be blank" if board.nil?

    direction = Direction.new(facing)
    direction.validate!
    check_place(x: x, y: y)
    raise ArgumentError, 'Coordinates are invalid' if !x.is_a?(Integer) || !y.is_a?(Integer)

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
    check_place(x: new_x, y: new_y)

    self.x, self.y = new_x, new_y
  end

  def left
    validate_active

    direction.left
  end

  def right
    validate_active

    direction.right
  end

  def location
    [x, y, facing]
  end

  def report
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

  def check_place(x:, y:)
    raise StandardError, 'Place is invalid' unless board.valid_place?(x: x, y: y)
  end
end
