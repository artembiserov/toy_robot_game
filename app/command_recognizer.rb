class CommandRecognizer
  attr_reader :robot

  def initialize(robot)
    @robot = robot
  end

  def call(command)
    case command
    when 'exit'
      throw(:finish_game)
    when /^PLACE/
      command.match(/^PLACE (\d+),(\d+),(.+)$/) do
        robot.set_to_table(x: $1.to_i, y: $2.to_i, facing: $3)
      end
    when 'REPORT'
      robot.show_report
    when 'MOVE'
      robot.move
    when 'LEFT'
      robot.turn_left
    when 'RIGHT'
      robot.turn_right
    end
  end
end
