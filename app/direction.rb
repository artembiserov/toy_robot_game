class Direction
  VALID_TYPES = %w(NORTH WEST SOUTH EAST).freeze

  attr_accessor :facing

  def initialize(facing)
    @facing = facing
  end

  def left
    change_direction { |index| index + 1 }
  end

  def right
    change_direction { |index| index - 1 }
  end

  def validate!
    raise StandardError, 'Direction is invalid' if invalid?
  end

  VALID_TYPES.each do |type|
    define_method "#{type.downcase}?" do
      facing == type
    end
  end

  private

  def change_direction(&block)
    index = VALID_TYPES.index(facing)
    next_index = block.call(index) % VALID_TYPES.size
    self.facing = VALID_TYPES[next_index]
  end

  def invalid?
    !VALID_TYPES.include?(facing)
  end
end
