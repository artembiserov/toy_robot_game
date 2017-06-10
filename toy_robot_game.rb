require_relative './robot'
require_relative './board'

class ToyRobotGame
  attr_reader :robot, :board

  def initialize
    @board = Board.new
    @robot = Robot.new(board: @board)
  end

  def start
    loop do
      begin
        command = gets.chomp

        case command
        when 'exit'
          break
        when /^PLACE/
          command.match(/^PLACE (\d+),(\d+),(.+)$/) do
            robot.set_to_table(x: $1.to_i, y: $2.to_i, facing: $3)
          end
        else
          next unless %w(MOVE LEFT RIGHT REPORT).include?(command)
          robot.public_send(command.downcase)
        end
      rescue => e
        puts e
      end
    end
  end
end

ToyRobotGame.new.start
