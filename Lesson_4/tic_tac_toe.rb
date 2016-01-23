require 'pry'

WHO_GOES_FIRST = 'player' # choose player or computer to go first

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagnals

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

system "clear"
prompt "Welcome to Tic-Tac-Toe! First to 5 wins!"
sleep(3)

# rubocop:disable Metrics/AbcSize
def display_board(brd, player_score, computer_score)
  system "clear"
  puts "You're an #{PLAYER_MARKER}, Computer is #{COMPUTER_MARKER}"
  puts "Your score: #{player_score}, Computer's score: #{computer_score}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+------"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+------"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimiter, word='or')
  arr[-1] = "#{word} #{arr.last}" if arr.size > 1
  arr.join(delimiter)
end

def player_places_piece!(brd)
  square = ''
  loop do
    # prompt "Choose a square #{empty_squares(brd).join(',')}:"
    prompt "Choose a position to place a piece: #{joinor(empty_squares(brd), ', ')}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "That's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def computer_offense(brd, square)
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end
  square
end

def computer_defense(brd, square)
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, PLAYER_MARKER)
    break if square
  end
  square
end

def computer_places_piece!(brd)
  # offense first
  square = computer_offense(brd, square)

  square = computer_defense(brd, square) unless square

  # Pick square 5 first on first go
  if !square && brd[5] == " "
    square = 5
  end

  # just pick a square
  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

def play_again?
  prompt "Play again? (y or n)"
  gets.chomp
end

def game_winner(computer_score, player_score)
  if computer_score == 5
    prompt "Computer won the game!"
    sleep(2)
  elsif player_score == 5
    prompt "Player won the game!"
    sleep(3)
  end
end

loop do
  player_score = 0
  computer_score = 0
  round = 1

  loop do
    board = initialize_board

    if WHO_GOES_FIRST == 'computer'
      computer_places_piece!(board)
    end

    loop do
      display_board(board, player_score, computer_score)

      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board, player_score, computer_score)

    if someone_won?(board)
      prompt "#{detect_winner(board)} wins round #{round}..."
      sleep(1)
      if detect_winner(board) == 'Computer'
        computer_score += 1
      else
        player_score += 1
      end
    else
      prompt "For round #{round} it's a tie!"
      sleep(2)
    end

    display_board(board, player_score, computer_score)

    break if game_winner(computer_score, player_score)

    computer_score == 5 || player_score == 5
    round += 1
  end
  break unless play_again?.downcase.start_with? "y"
end
prompt "Thanks for playing Tic Tac Toe!"
