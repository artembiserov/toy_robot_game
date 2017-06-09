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

  describe "#valid_place?" do
    context 'when place is within board' do
      it 'is true' do
        expect(board.valid_place?(x: 3, y: 3)).to be_truthy
      end
    end

    context 'when place is in boarder of board' do
      it 'is true' do
        expect(board.valid_place?(x: 4, y: 4)).to be_truthy
      end
    end

    context 'when place is outside of board' do
      it 'is false' do
        expect(board.valid_place?(x: 5, y: 2)).to be_falsey
      end
    end
  end
end
