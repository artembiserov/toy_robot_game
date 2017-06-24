class Direction
  VALID_TYPES = %w(NORTH WEST SOUTH EAST).freeze

  attr_reader :facing

  def initialize(facing)
    @facing = facing
    @value = VALID_TYPES.index(facing)
  end

  def turn_left
    @value = (@value + 1) % VALID_TYPES.size
    change_direction!
  end

  def turn_right
    @value = (@value - 1) % VALID_TYPES.size
    change_direction!
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

  def change_direction!
    @facing = VALID_TYPES[@value]
  end

  def invalid?
    !VALID_TYPES.include?(facing)
  end
end
