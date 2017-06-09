require_relative './facing'

class Robot
  attr_accessor :board
  attr_reader :x, :y, :facing

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

    facing = Facing.new(facing)
    raise StandardError, "Facing is invalid" if facing.invalid?
    raise StandardError, "Place is invalid" unless board.valid_place?(x: x, y: y)

    @x = x
    @y = y
    @facing = facing
    @active = true
  end

  def active?
    @active
  end
end
