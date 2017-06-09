class Board
  attr_reader :width, :length

  def initialize(width: 5, length: 5)
    @width = width
    @length = length
  end
end
