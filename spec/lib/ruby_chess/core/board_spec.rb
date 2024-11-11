require 'spec_helper'

RSpec.describe RubyChess::Core::Board do
  describe '#initialize' do
    it 'sets up the board with pieces in the correct positions' do
      board = described_class.new

      [0, 1].each do |rank|
        8.times do |file|
          square = rank * 8 + file
          piece = board.piece_at(square)
          expect(piece.color).to eq(:white)
        end
      end

      [6, 7].each do |rank|
        8.times do |file|
          square = rank * 8 + file
          piece = board.piece_at(square)
          expect(piece.color).to eq(:black)
        end
      end

      [2, 3, 4, 5].each do |rank|
        8.times do |file|
          square = rank * 8 + file
          piece = board.piece_at(square)
          expect(piece).to be_nil
        end
      end
    end
  end

  describe '#attackers' do
    let(:board) { described_class.new }

    it 'identifies attackers on a3 correctly' do
      attackers = board.attackers(:white, RubyChess::Core::Square.from_name('a3'))
      expect(attackers).to include(RubyChess::Core::Square.from_name('b1'))
      expect(attackers).to include(RubyChess::Core::Square.from_name('b2'))

      expect(attackers).not_to include(RubyChess::Core::Square.from_name('a2'))
    end

    it 'identifies attackers on e4 correctly' do
      attackers = board.attackers(:black, RubyChess::Core::Square.from_name('e4'))
      expect(attackers).to be_empty
    end

    it 'identifies attackers on e5 correctly' do
      attackers = board.attackers(:white, RubyChess::Core::Square.from_name('e5'))
      expect(attackers).to be_empty
    end

    it 'identifies attackers on a7 correctly' do
      attackers = board.attackers(:black, RubyChess::Core::Square.from_name('a7'))
      expect(attackers).to include(RubyChess::Core::Square.from_name('a8'))
    end

    it 'identifies attackers on h7 correctly' do
      attackers = board.attackers(:black, RubyChess::Core::Square.from_name('h7'))
      expect(attackers).to include(RubyChess::Core::Square.from_name('h8'))
    end
  end
  describe '#attackers' do
    let(:empty_board) { described_class.new('8/8/8/8/8/8/8/8 w - - 0 1') }

    context 'with a knight' do
      it 'identifies knight attackers correctly' do
        board = described_class.new('8/8/8/8/8/5N2/8/8 w - - 0 1')
        attackers = board.attackers(:white, RubyChess::Core::Square.from_name('e5'))
        expect(attackers).to include(RubyChess::Core::Square.from_name('f3'))
      end
    end

    context 'with a bishop' do
      it 'identifies bishop attackers correctly' do
        board = described_class.new('8/8/8/8/8/3B4/8/8 w - - 0 1')
        attackers = board.attackers(:white, RubyChess::Core::Square.from_name('f5'))
        expect(attackers).to include(RubyChess::Core::Square.from_name('d3'))
      end
    end

    context 'with a rook' do
      it 'identifies rook attackers correctly' do
        board = described_class.new('8/8/8/8/8/R7/8/8 w - - 0 1')
        attackers = board.attackers(:white, RubyChess::Core::Square.from_name('a5'))
        expect(attackers).to include(RubyChess::Core::Square.from_name('a3'))
      end
    end

    context 'with a queen' do
      it 'identifies queen attackers correctly' do
        board = described_class.new('8/8/8/8/8/3Q4/8/8 w - - 0 1')
        attackers = board.attackers(:white, RubyChess::Core::Square.from_name('f5'))
        expect(attackers).to include(RubyChess::Core::Square.from_name('d3'))
      end
    end

    context 'with a king' do
      it 'identifies king attackers correctly' do
        board = described_class.new('8/8/8/8/8/4K3/8/8 w - - 0 1')
        attackers = board.attackers(:white, RubyChess::Core::Square.from_name('e4'))
        expect(attackers).to include(RubyChess::Core::Square.from_name('e3'))
      end
    end

    context 'with pawns' do
      it 'identifies white pawn attackers correctly' do
        board = described_class.new('8/8/8/8/8/8/3P4/8 w - - 0 1')
        attackers = board.attackers(:white, RubyChess::Core::Square.from_name('e3'))
        expect(attackers).to include(RubyChess::Core::Square.from_name('d2'))
      end

      it 'identifies black pawn attackers correctly' do
        board = described_class.new('8/3p4/8/8/8/8/8/8 b - - 0 1')
        attackers = board.attackers(:black, RubyChess::Core::Square.from_name('e6'))
        expect(attackers).to include(RubyChess::Core::Square.from_name('d7'))
      end
    end

    context 'with empty squares' do
      it 'identifies no attackers for empty squares' do
        board = described_class.new('8/8/8/8/8/8/8/8 w - - 0 1')
        attackers = board.attackers(:white, RubyChess::Core::Square.from_name('e4'))
        expect(attackers).to be_empty
      end
    end
  end

end



