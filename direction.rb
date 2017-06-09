class Direction
  VALID_TYPES = %w(NORTH WEST SOUTH EAST).freeze

  attr_reader :facing

  def initialize(facing)
    @facing = facing
  end

  def invalid?
    !VALID_TYPES.include?(facing)
  end

  VALID_TYPES.each do |type|
    define_method "#{type.downcase}?" do
      facing == type
    end
  end
end
