require 'ruby_chess'

puts "Testing square conversions:"
square_index = RubyChess::Core::Square.from_name('e4')
puts "e4 index: #{square_index}"
puts "Converting back: #{RubyChess::Core::Square.to_name(square_index)}"

puts "\nTesting pieces:"
white_king = RubyChess::Core::Piece.new(RubyChess::Core::Piece::TYPES[:king], :white)
black_pawn = RubyChess::Core::Piece.new(RubyChess::Core::Piece::TYPES[:pawn], :black)

puts "White king symbol: #{white_king.symbol}"
puts "White king unicode: #{white_king.unicode_symbol}"
puts "Black pawn symbol: #{black_pawn.symbol}"
puts "Black pawn unicode: #{black_pawn.unicode_symbol}"

puts "\nTesting error handling:"
begin
  RubyChess::Core::Square.from_name('i9')
rescue RubyChess::Error::InvalidSquare => e
  puts "Caught expected error: #{e.message}"
end
