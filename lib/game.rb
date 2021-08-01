# frozen_string_literal: true

# hello there
# board
a = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

def print_board(board)
  board.each do |row|
    row.each do |x|
      print "#{x} "
    end
    print "\n"
  end
end

print_board(a)

while true
  print_board(a)
  user_input = gets.chomp
  break if user_input == 'q'

  puts 'Hello' if (a.include?(user_input.to_i)) 
  #a[a.index?(user_input.to_i)] = 'X' if a.include?(user_input.to_i)
end
