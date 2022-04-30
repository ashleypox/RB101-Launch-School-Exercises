require 'pry'

# contstants
EMPTY_MARKER = ' '
PLAYER_MARKER = 'X'
COMP_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals
# methods
def prompt(str)
  puts "==> #{str}"
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You are the #{PLAYER_MARKER + "'s"}."
  puts "The computer is the #{COMP_MARKER + "'s"}."
  puts "First to 5 points wins!"
  puts ""
  puts "     |     |     "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |     "
  puts "-----------------"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |     "
  puts "-----------------"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |     "
  puts ''
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def intialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = EMPTY_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == EMPTY_MARKER }
end

def joinor(arr)
  if arr.size == 1
    arr[0]
  else
    arr.join(", ").insert(-2, "or ")
  end
end

def player_places_piece!(brd)
  square = ''

  loop do
    prompt "Choose a square: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    if empty_squares(brd).include?(square)
      break
    else
      prompt "Invalid selection."
    end
  end

  brd[square] = PLAYER_MARKER
end

def comp_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMP_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMP_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def winner?(brd)
  !!detect_winner(brd)
end

def update_score(brd, arr)
  if detect_winner(brd) == 'Player'
    arr[0] += 1
  elsif detect_winner(brd) == 'Computer'
    arr[1] += 1
  elsif board_full?(brd)
    arr[2] += 1
  end
end

# main loop
loop do
  # Display empty board
  board = intialize_board
  display_board(board)
  score = [0, 0, 0]

  # score tracking loop
  loop do
    board = intialize_board
    display_board(board)
    prompt "The current score is PLAYER: #{score[0]}, COMPTUER: #{score[1]}, TIES: #{score[2]}"

    # main game
    loop do
      player_places_piece!(board)
      display_board(board)

      if winner?(board)
        update_score(board, score)
        prompt "#{detect_winner(board)} won!"
        prompt "Press any key to start next game."
        cont = gets.chomp
        break if cont
      elsif board_full?(board)
        update_score(board, score)
        prompt "It's a tie!"
        prompt "Press any key to start next game."
        cont = gets.chomp
        break if cont
      end

      comp_places_piece!(board)
      display_board(board)

      if winner?(board)
        update_score(board, score)
        prompt "#{detect_winner(board)} won!"
        prompt "Press any key to start next game."
        cont = gets.chomp
        break if cont
      elsif board_full?(board)
        update_score(board, score)
        prompt "It's a tie!"
        prompt "Press any key to start next game."
        cont = gets.chomp
        break if cont
      end
    end
    
    if score[0] == 5 || score[1] == 5
      prompt "The final score is PLAYER: #{score[0]}, COMPTUER: #{score[1]}, TIES: #{score[2]}"
      break
    end
  end

  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt("Thanks for playing Tic Tac Toe! Bye!")
