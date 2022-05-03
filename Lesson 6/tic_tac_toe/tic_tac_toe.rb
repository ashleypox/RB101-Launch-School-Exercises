require 'yaml'

# contstants
MESSAGES = YAML.load_file('tic_tac_toe.yml')

EMPTY_MARKER = ' '
PLAYER_MARKER = 'X'
COMP_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals

# methods
def prompt(str)
  puts "=== #{str}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts MESSAGES['heading']
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
# rubocop:enable Metrics/AbcSize

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

def player_places(brd)
  square = ''

  loop do
    prompt "Choose a square: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    if empty_squares(brd).include?(square)
      break
    else
      prompt(MESSAGES['invalid_selection'])
    end
  end

  brd[square] = PLAYER_MARKER
end

def comp_places(brd)
  square = if immediate_threat?(brd, COMP_MARKER) == true
             find_threat(brd, COMP_MARKER)
           elsif immediate_threat?(brd, PLAYER_MARKER) == true
             find_threat(brd, PLAYER_MARKER)
           elsif empty_squares(brd).include?(5)
             5
           else
             empty_squares(brd).sample
           end

  brd[square] = COMP_MARKER
end

def places_piece!(user, brd)
  if user == 'player'
    player_places(brd)
  elsif user == 'comp'
    comp_places(brd)
  end
end

def game_loop(user1, user2, brd, scr)
  loop do
    # first turn
    places_piece!(user1, brd)
    display_board(brd)
    if end_game?(brd, scr)
      prompt(MESSAGES['next_game'])
      break if gets.chomp
    end

    # second user turn
    places_piece!(user2, brd)
    display_board(brd)
    if end_game?(brd, scr)
      prompt(MESSAGES['next_game'])
      break if gets.chomp
    end
  end
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

def immediate_threat?(brd, marker)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(marker) == 2 &&
       brd.values_at(*line).count(EMPTY_MARKER) == 1
      return true
    else
      false
    end
  end
end

def find_threat(brd, marker)
  threat = []
  # returns the array the threat is in
  threat_line = WINNING_LINES.select do |line|
    brd.values_at(*line).count(marker) == 2
  end
  # returns the number position of the threat
  threat_line.each do |inner_arr|
    inner_arr.each do |num|
      threat << num if brd[num] == EMPTY_MARKER
    end
  end

  threat[0]
end

def end_game?(brd, scr)
  if winner?(brd)
    update_score(brd, scr)
    prompt "#{detect_winner(brd)} won!"
    true
  elsif board_full?(brd)
    update_score(brd, scr)
    prompt(MESSAGES['tie'])
    true
  end
end

def current_score(scr)
  "PLAYER: #{scr[0]}, COMPTUER: #{scr[1]}, TIES: #{scr[2]}"
end

# Welcome message and rules
puts(MESSAGES['welcome'])
display_rules = gets.chomp

if display_rules.start_with?('y')
  puts(MESSAGES['rules'])
  gets.chomp
end

# Main loop
loop do
  # initialize (or reset) score
  score = [0, 0, 0]

  # begin play-to-5-wins
  loop do
    board = intialize_board
    display_board(board)
    prompt("The current score is #{current_score(score)}.")

    # who goes first?
    puts(MESSAGES['first?'])
    first_move = gets.chomp.downcase
    first_move = ['y', 'n'].sample if first_move != ('y' || 'n')

    if first_move.start_with?('y')
      game_loop('player', 'comp', board, score)
    else
      game_loop('comp', 'player', board, score)
    end

    # 5 wins?
    if score[0] == 5 || score[1] == 5
      prompt("The final score is #{current_score(score)}.")
      break
    end
  end

  prompt(MESSAGES['play_again'])
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt("Thanks for playing Tic Tac Toe! Bye!")
