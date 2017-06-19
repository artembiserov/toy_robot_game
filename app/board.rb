class Board
  attr_reader :width, :length

  def initialize(width: 5, length: 5)
    raise ArgumentError('Dimensions have to be integers') if !width.is_a?(Integer) || !length.is_a?(Integer)

    @width = width
    @length = length
  end

  def validate_place!(x:, y:)
    raise ArgumentError, 'Coordinates are invalid' if !x.is_a?(Integer) || !y.is_a?(Integer)
    raise StandardError, 'Place is invalid' unless valid_place?(x: x, y: y)
  end

  def valid_place?(x:, y:)
    0 <= x && x <= (width - 1) && 0 <= y && y <= (length - 1)
  end
end
