require 'spec_helper'

RSpec.describe RubyChess::Core::Square do
  describe '.from_name' do
    it 'converts valid square name to index' do
      expect(described_class.from_name('a1')).to eq(0)
      expect(described_class.from_name('h8')).to eq(63)
    end
    
    it 'raises error for invalid square name' do
      expect { described_class.from_name('i9') }
        .to raise_error(RubyChess::Error::InvalidSquare)
    end
  end

  describe '.to_name' do
    it 'converts valid index to square name' do
      expect(described_class.to_name(0)).to eq('a1')
      expect(described_class.to_name(63)).to eq('h8')
    end

    it 'raises error for invalid index' do
      expect { described_class.to_name(64) }
        .to raise_error(RubyChess::Error::InvalidSquare)
    end
  end
end

