
# initialize board
new_board = {}
(1..9).each { |num| new_board[num] = " " }

# determine size of board with empty values
empty_squares = new_board.keys.select { |num| new_board[num] == " " }
num_empty_squares = empty_squares.size

# loop through the empty sqaures

 while num_empty_squares - 1 > 0
   puts "#{num_empty_squares},"
   num_empty_squares -= 1
 end


new_board.keys.select { |num| while new_board.keys.size < 9 new_board[num] == " " end}


new_board.keys.select do |num|
  if num <= new_board.size - 1
    then
  new_board[num] == " "
  end
end


# def join_or(brd)
#   brd.keys.select do |num|
#     if num <= brd.size
#     then
#     brd[num] == " "
#     end
#   end
# end

# prompt "Choose a square #{join_or(brd).join(',')}"