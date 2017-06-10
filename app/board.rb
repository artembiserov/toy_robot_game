class Board
  attr_reader :width, :length

  def initialize(width: 5, length: 5)
    raise ArgumentError('Dimensions have to be integers') if !width.is_a?(Integer) || !length.is_a?(Integer)

    @width = width
    @length = length
  end

  def valid_place?(x:, y:)
    0 <= x && x <= (width - 1) && 0 <= y && y <= (length - 1)
  end
end
