require_relative '../app/board'
require_relative '../app/robot'

describe Robot do
  subject(:robot) { Robot.new }

  let(:board) { Board.new }
  let(:active_robot) do
    robot = Robot.new
    robot.set_to_table(x: 3, y: 4, facing: 'NORTH')
    robot
  end

  describe '#initialize' do
    its(:active?) { is_expected.to be_falsey }
  end

  describe '#set_to_table' do
    context 'when it is put to invalid place' do
      it 'raises invalid error' do
        expect { robot.set_to_table(x: 5, y: 5, facing: 'NORTH') }.to raise_error(/Place is invalid/)
      end
    end

    context 'when facing is invalid' do
      it 'raises invalid error' do
        expect { robot.set_to_table(x: 5, y: 5, facing: 'invalid') }.to raise_error(/Direction is invalid/)
      end
    end

    context 'when it is put to valid place' do
      it 'makes it active' do
        expect { robot.set_to_table(x: 3, y: 3, facing: 'NORTH') }.to change { robot.active? }.to true
      end
    end
  end

  describe '#move' do
    context 'when next place is valid' do
      before do
        robot.set_to_table(x: 3, y: 3, facing: 'NORTH')
      end

      it 'does the movement' do
        expect { robot.move }.to change { robot.y }.from(3).to(4)
      end

      it 'does not move to other direction' do
        expect { robot.move }.not_to change { robot.x }
      end
    end

    context 'when next place is invalid' do
      before do
        robot.set_to_table(x: 3, y: 4, facing: 'NORTH')
      end

      it 'raises an error' do
        expect { robot.move }.to raise_error(/Place is invalid/)
      end
    end

    context 'when robot is not active' do
      it 'raises an error' do
        expect { robot.move }.to raise_error(/Robot is not active/)
      end
    end
  end

  describe '#turn_left' do
    it 'changes the direction' do
      active_robot.turn_left

      expect(active_robot.facing).to eq('WEST')
    end
  end

  describe '#turn_rigth' do
    it 'changes the direction' do
      active_robot.turn_right

      expect(active_robot.facing).to eq('EAST')
    end
  end

  describe '#location' do
    it 'show current location' do
      expect(active_robot.location).to eq([3, 4, 'NORTH'])
    end
  end
end
