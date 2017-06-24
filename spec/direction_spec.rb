require_relative '../app/direction'

describe Direction do
  let(:direction) { Direction.new(facing) }

  describe '#turn_left' do
    context 'when facing is NORTH' do
      let(:facing) { 'NORTH' }

      it 'changes facing to WEST' do
        expect { direction.turn_left }.to change { direction.facing }.to 'WEST'
      end
    end

    context 'when facing is WEST' do
      let(:facing) { 'WEST' }

      it 'changes facing to SOUTH' do
        expect { direction.turn_left }.to change { direction.facing }.to 'SOUTH'
      end
    end
  end

  describe '#turn_right' do
    context 'when facing is SOUTH' do
      let(:facing) { 'SOUTH' }

      it 'changes facing to WEST' do
        expect { direction.turn_right }.to change { direction.facing }.to 'WEST'
      end
    end

    context 'when facing is EAST' do
      let(:facing) { 'EAST' }

      it 'changes facing to SOUTH' do
        expect { direction.turn_right }.to change { direction.facing }.to 'SOUTH'
      end
    end
  end
end
