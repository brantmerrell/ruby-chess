module RubyChess
  module Core
    class Board
      STARTING_FEN = 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1'
      
      attr_reader :squares, :turn
      
      def initialize(fen = STARTING_FEN)
        @squares = Array.new(64)
        setup_from_fen(fen)
      end
      
      def piece_at(square)
        validate_square!(square)
        @squares[square]
      end
      
      def attackers(color, square)
        validate_square!(square)
        attacking_squares = []
        
        0.upto(63) do |src_square|
          piece = piece_at(src_square)
          if piece && piece.color == color && attacks_between?(src_square, square)
            attacking_squares << src_square
          end
        end
        
        attacking_squares
      end
      
      private
      
      def validate_square!(square)
        unless square.between?(0, 63)
          raise Error::InvalidSquare, "Square index must be between 0 and 63"
        end
      end
      
      def attacks_between?(src, dest)
        piece = piece_at(src)
        return false unless piece
        
        case piece.type
        when Piece::TYPES[:pawn]
          pawn_attacks?(src, dest)
        when Piece::TYPES[:knight]
          knight_attacks?(src, dest)
        when Piece::TYPES[:bishop]
          bishop_attacks?(src, dest)
        when Piece::TYPES[:rook]
          rook_attacks?(src, dest)
        when Piece::TYPES[:queen]
          bishop_attacks?(src, dest) || rook_attacks?(src, dest)
        when Piece::TYPES[:king]
          king_attacks?(src, dest)
        end
      end
      
      def pawn_attacks?(src, dest)
        src_rank = src / 8
        src_file = src % 8
        dest_rank = dest / 8
        dest_file = dest % 8
        
        if piece_at(src).color == :white
          dest_rank == src_rank + 1 && (dest_file - src_file).abs == 1
        else
          dest_rank == src_rank - 1 && (dest_file - src_file).abs == 1
        end
      end
      
      def knight_attacks?(src, dest)
        src_rank = src / 8
        src_file = src % 8
        dest_rank = dest / 8
        dest_file = dest % 8
        
        rank_diff = (dest_rank - src_rank).abs
        file_diff = (dest_file - src_file).abs
        
        (rank_diff == 2 && file_diff == 1) || (rank_diff == 1 && file_diff == 2)
      end
      
      def bishop_attacks?(src, dest)
        src_rank = src / 8
        src_file = src % 8
        dest_rank = dest / 8
        dest_file = dest % 8
        
        (dest_rank - src_rank).abs == (dest_file - src_file).abs
      end
      
      def rook_attacks?(src, dest)
        src_rank = src / 8
        src_file = src % 8
        dest_rank = dest / 8
        dest_file = dest % 8
        
        src_rank == dest_rank || src_file == dest_file
      end
      
      def king_attacks?(src, dest)
        src_rank = src / 8
        src_file = src % 8
        dest_rank = dest / 8
        dest_file = dest % 8
        
        (dest_rank - src_rank).abs <= 1 && (dest_file - src_file).abs <= 1
      end
      
      def setup_from_fen(fen)
        position, turn, = fen.split
        
        rank = 7
        file = 0
        
        position.each_char do |char|
          if char == '/'
            rank -= 1
            file = 0
          elsif char.match?(/\d/)
            file += char.to_i
          else
            square = rank * 8 + file
            @squares[square] = Piece.from_symbol(char)
            file += 1
          end
        end
        
        @turn = turn == 'w' ? :white : :black
      end
    end
  end
end

