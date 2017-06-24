require_relative '../app/command_recognizer'
require_relative '../app/robot'

describe CommandRecognizer do
  let(:robot) { Robot.new }
  let(:command_recognizer) { described_class.new(robot) }

  before do
    robot.set_to_table(x: 1, y: 1, facing: 'SOUTH')
  end

  describe 'PLACE' do
    before do
      allow(robot).to receive(:set_to_table)
    end

    it 'says robot to set to table' do
      command_recognizer.call("PLACE 1,1,NORTH")
      expect(robot).to have_received(:set_to_table).with(x: 1, y: 1, facing: 'NORTH')
    end
  end

  describe 'LEFT' do
    before do
      allow(robot).to receive(:turn_left)
    end

    it 'says robot to turn left' do
      command_recognizer.call("LEFT")
      expect(robot).to have_received(:turn_left)
    end
  end

  describe 'RIGHT' do
    before do
      allow(robot).to receive(:turn_right)
    end

    it 'says robot to turn right' do
      command_recognizer.call("RIGHT")
      expect(robot).to have_received(:turn_right)
    end
  end

  describe 'MOVE' do
    before do
      allow(robot).to receive(:move)
    end

    it 'says robot to move' do
      command_recognizer.call("MOVE")
      expect(robot).to have_received(:move)
    end
  end

  describe 'REPORT' do
    before do
      allow(robot).to receive(:show_report)
    end

    it 'says robot to show report' do
      command_recognizer.call("REPORT")
      expect(robot).to have_received(:show_report)
    end
  end
end
