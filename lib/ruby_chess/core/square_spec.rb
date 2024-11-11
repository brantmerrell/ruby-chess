require 'spec_helper'

RSpec.describe RubyChess::Core::Square do
  describe '.from_name' do
    it 'maps first rank squares to indices 0-7' do
      expect(described_class.from_name('a1')).to eq(0)
      expect(described_class.from_name('b1')).to eq(1)
      expect(described_class.from_name('c1')).to eq(2)
      expect(described_class.from_name('d1')).to eq(3)
      expect(described_class.from_name('e1')).to eq(4)
      expect(described_class.from_name('f1')).to eq(5)
      expect(described_class.from_name('g1')).to eq(6)
      expect(described_class.from_name('h1')).to eq(7)
    end

    it 'maps second rank squares to indices 8-15' do
      expect(described_class.from_name('a2')).to eq(8)
      expect(described_class.from_name('b2')).to eq(9)
      expect(described_class.from_name('c2')).to eq(10)
      expect(described_class.from_name('d2')).to eq(11)
      expect(described_class.from_name('e2')).to eq(12)
      expect(described_class.from_name('f2')).to eq(13)
      expect(described_class.from_name('g2')).to eq(14)
      expect(described_class.from_name('h2')).to eq(15)
    end

    it 'maps eighth rank squares to indices 56-63' do
      expect(described_class.from_name('a8')).to eq(56)
      expect(described_class.from_name('b8')).to eq(57)
      expect(described_class.from_name('c8')).to eq(58)
      expect(described_class.from_name('d8')).to eq(59)
      expect(described_class.from_name('e8')).to eq(60)
      expect(described_class.from_name('f8')).to eq(61)
      expect(described_class.from_name('g8')).to eq(62)
      expect(described_class.from_name('h8')).to eq(63)
    end

    it 'raises error for invalid square name' do
      expect { described_class.from_name('i9') }
        .to raise_error(RubyChess::Error::InvalidSquare)
    end
  end

  describe '.to_name' do
    it 'converts indices 0-7 to first rank squares' do
      expect(described_class.to_name(0)).to eq('a1')
      expect(described_class.to_name(1)).to eq('b1')
      expect(described_class.to_name(2)).to eq('c1')
      expect(described_class.to_name(3)).to eq('d1')
      expect(described_class.to_name(4)).to eq('e1')
      expect(described_class.to_name(5)).to eq('f1')
      expect(described_class.to_name(6)).to eq('g1')
      expect(described_class.to_name(7)).to eq('h1')
    end

    it 'converts indices 8-15 to second rank squares' do
      expect(described_class.to_name(8)).to eq('a2')
      expect(described_class.to_name(9)).to eq('b2')
      expect(described_class.to_name(10)).to eq('c2')
      expect(described_class.to_name(11)).to eq('d2')
      expect(described_class.to_name(12)).to eq('e2')
      expect(described_class.to_name(13)).to eq('f2')
      expect(described_class.to_name(14)).to eq('g2')
      expect(described_class.to_name(15)).to eq('h2')
    end

    it 'converts indices 56-63 to eighth rank squares' do
      expect(described_class.to_name(56)).to eq('a8')
      expect(described_class.to_name(57)).to eq('b8')
      expect(described_class.to_name(58)).to eq('c8')
      expect(described_class.to_name(59)).to eq('d8')
      expect(described_class.to_name(60)).to eq('e8')
      expect(described_class.to_name(61)).to eq('f8')
      expect(described_class.to_name(62)).to eq('g8')
      expect(described_class.to_name(63)).to eq('h8')
    end

    it 'raises error for invalid index' do
      expect { described_class.to_name(64) }
        .to raise_error(RubyChess::Error::InvalidSquare)
    end
  end
end
