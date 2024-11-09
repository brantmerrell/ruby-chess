module RubyChess
  module Core
    class Piece
      TYPES = {
        pawn: 1,
        knight: 2,
        bishop: 3,
        rook: 4,
        queen: 5,
        king: 6
      }.freeze
      
      SYMBOLS = {
        1 => 'p',
        2 => 'n',
        3 => 'b',
        4 => 'r',
        5 => 'q',
        6 => 'k'
      }.freeze
      
      UNICODE_SYMBOLS = {
        white: {
          1 => '♙',
          2 => '♘',
          3 => '♗',
          4 => '♖',
          5 => '♕',
          6 => '♔' 
        },
        black: {
          1 => '♟',
          2 => '♞',
          3 => '♝',
          4 => '♜',
          5 => '♛',
          6 => '♚' 
        }
      }.freeze
      
      attr_reader :type, :color
      
      def initialize(type, color)
        @type = type
        @color = color
        validate!
      end
      
      def symbol
        sym = SYMBOLS[@type]
        @color == :white ? sym.upcase : sym
      end
      
      def unicode_symbol(invert_color: false)
        color_key = invert_color ? opposite_color : @color
        UNICODE_SYMBOLS[color_key][@type]
      end
      
      def self.from_symbol(symbol)
        type = SYMBOLS.key(symbol.downcase)
        raise Error::InvalidPiece, "Invalid piece symbol: #{symbol}" if type.nil?
        
        new(type, symbol == symbol.upcase ? :white : :black)
      end
      
      def ==(other)
        other.is_a?(Piece) && 
          other.type == @type && 
          other.color == @color
      end
      
      private
      
      def validate!
        unless TYPES.values.include?(@type)
          raise Error::InvalidPiece, "Invalid piece type: #{@type}"
        end
        
        unless [:white, :black].include?(@color)
          raise Error::InvalidPiece, "Invalid piece color: #{@color}"
        end
      end
      
      def opposite_color
        @color == :white ? :black : :white
      end
    end
  end
end


