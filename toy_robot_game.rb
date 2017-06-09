class ToyRobotGame
  def initialize
    @robot = Robot.new
    @board = Board.new(x: 5, y: 5)
  end

  def start
    loop do
      name = gets.chomp
      break if name == 'exit'
    end
  end
end

ToyRobotGame.new.start
