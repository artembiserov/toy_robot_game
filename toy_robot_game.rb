require_relative './app/robot'
require_relative './app/board'
require_relative './app/command_recognizer'

class ToyRobotGame
  attr_reader :robot, :board

  def initialize
    @robot = Robot.new
    @command_recognizer = CommandRecognizer.new(@robot)
  end

  def start
    catch :finish_game do
      loop do
        begin
          command = gets.chomp
          @command_recognizer.call(command)
        rescue
        end
      end
    end
  end
end

ToyRobotGame.new.start
