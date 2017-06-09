require_relative '../board'
require_relative '../robot'

describe Robot do
  let(:board) { Board.new }
  subject(:robot) { Robot.new }

  before do
    robot.add_to_board(board)
  end

  describe '#initialize' do
    its(:active?) { is_expected.to be_falsey }
  end

  describe '#add_to_board' do
    before do
      robot.board = nil
    end

    context 'when board is invalid' do
      it 'return error' do
        expect { robot.add_to_board(nil) }.to raise_error(ArgumentError)
      end
    end

    context 'when board is valid' do
      it 'adds robot to the board' do
        robot.add_to_board(board)
        expect(robot.board).to eq(board)
      end
    end
  end

  describe '#set_to_table' do
    context 'when it is put to invalid place' do
      it 'raises invalid error' do
        expect { robot.set_to_table(x: 5, y: 5, facing: 'NORTH') }.to raise_error(/Place is invalid/)
      end
    end

    context 'when facing is invalid' do
      it 'raises invalid error' do
        expect { robot.set_to_table(x: 5, y: 5, facing: 'invalid') }.to raise_error(/Facing is invalid/)
      end
    end

    context 'when it is put to valid place' do
      it 'makes it active' do
        expect { robot.set_to_table(x: 3, y: 3, facing: 'NORTH') }.to change { robot.active? }.to true
      end
    end
  end

  describe '#move' do
  end

  describe '#left' do
  end

  describe '#rigth' do
  end

  describe '#location' do
  end
end
