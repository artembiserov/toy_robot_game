require_relative './direction'

class Robot
  attr_accessor :board, :x, :y, :direction

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
    raise StandardError, "Direction is invalid" if direction.invalid?
    raise StandardError, "Place is invalid" unless board.valid_place?(x: x, y: y)

    @x = x
    @y = y
    @direction = direction
    @active = true
  end

  def move
    raise StandardError, "Robot is not active" unless active?
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
    raise StandardError, "Place is invalid" unless board.valid_place?(x: new_x, y: new_y)

    self.x, self.y = new_x, new_y
  end

  def left
    raise StandardError, "Robot is not active" unless active?

    direction.left
  end

  def right
    raise StandardError, "Robot is not active" unless active?

    direction.right
  end

  def location
    [x, y, facing]
  end

  def active?
    @active
  end

  def facing
    direction.facing
  end
end
