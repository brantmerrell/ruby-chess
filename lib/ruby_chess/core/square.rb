module RubyChess
  module Core
    class Square
      RANKS = ('1'..'8').to_a.freeze
      FILES = ('a'..'h').to_a.freeze
      NAMES = FILES.product(RANKS).map(&:join).freeze
      
      class << self
        def from_name(name)
          index = NAMES.index(name.downcase)
          raise Error::InvalidSquare, "Invalid square name: #{name}" if index.nil?
          index
        end
        
        def to_name(index)
          raise Error::InvalidSquare, "Invalid square index: #{index}" unless valid_index?(index)
          NAMES[index]
        end
        
        private
        
        def valid_index?(index)
          index.between?(0, 63)
        end
      end
    end
  end
end

