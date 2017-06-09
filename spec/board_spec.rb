require_relative '../board.rb'

describe Board do
  let(:board) { Board.new }

  describe '#initialize' do
    it 'has dimension 5x5 by default' do
      expect(board.width).to eq 5
      expect(board.length).to eq 5
    end

    context 'when board initialize with parameters' do
      subject(:board) { Board.new(width: 4, length: 4) }

      its(:width) { is_expected.to eq 4 }
      its(:length) { is_expected.to eq 4 }
    end
  end
end
