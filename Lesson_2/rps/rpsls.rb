# Rock Paper Scissors Lizard Spock game
# constants
VALID_CHOICES = %w(r p sc l sp)

# methods
def prompt(message)
  puts("=> #{message}")
end

def rock_win(first, second)
  first == 'r' && second == ('sc' || 'l')
end

def paper_win(first, second)
  first == 'p' && second == ('r' || 'sp')
end

def scissors_win(first, second)
  first == 'sc' && second == ('p'|| 'l')
end

def lizard_win(first, second)
  first == 'l' && second == ('p' || 'sp')
end

def spock_win(first, second)
  first == 'sp' && second == ('sc'|| 'r')
end

def win?(first, second)
  rock_win(first, second) || 
    paper_win(first, second) || 
    scissors_win(first, second) || 
    lizard_win(first, second) || 
    spock_win(first, second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You win!")
  elsif win?(computer, player)
    prompt("You lost.")
  else
    prompt("It's a tie!")
  end
end

def expand_names(input)
  case input
  when 'r'
    'Rock'
  when 'p'
    'Paper'
  when 'sc'
    'Scissors'
  when 'l'
    'Lizard'
  when 'sp'
    'Spock'
  end
end

def score(player, computer, points)
  if win?(player, computer)
    points[0] += 1
  elsif win?(computer, player)
    points[1] += 1
  else
    points[2] += 1
  end
end

# welcome and rules
prompt("Welcome to Rock, Paper, Scissors, Lizard, Spock! The first to three points wins.")
prompt("-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-")
prompt("Do you want an explaination of the rules? Type 'y' for yes.")
input = gets.chomp.downcase

if input == 'y'
  puts <<-MSG
    The game works much like regular 'Rock, Paper, Scissors' 
    but with two added options: Lizard and Spock.
    -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
    Rock beats Scissors and Lizard.
    Paper beats Rock and Spock.
    Scissors beats Paper and Lizard.
    Lizard beats Spock and Paper.
    Spock beats Scissors and Rock.
    -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
    MSG
end

scoreboard = [0,0,0]

# main loop
loop do
  # get player choice
  choice = ''
  loop do
    prompt("Choose one: Rock, Paper, Scissors, Lizard, Spock! 
      Type 'r' for rock, 'p' for paper, 'sc' for scissors, 
      'l' for lizard, or 'sp' for spock.)")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("Please select a valid choice.")
    end
  end

  # get computer choice
  computer_choice = ['r', 'p', 'sc', 'l', 'sp'].sample

  # determine and display winner
  display_results(choice, computer_choice)
  prompt("You chose #{expand_names(choice)}, and the computer chose #{expand_names(computer_choice)}.")
  puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-"

  # keep score
  score(choice, computer_choice, scoreboard)
  prompt("You have #{scoreboard[0]} wins, #{scoreboard[1]} losses, and #{scoreboard[2]} ties.")
  puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-"
  
  #break
  if (scoreboard[0] == 3) || (scoreboard[1] == 3)
    prompt("The final score was player: #{scoreboard[0]}, computer: #{scoreboard[1]}.")
    if scoreboard[0] == 3
      prompt("Player wins!")
    elsif scoreboard[1] == 3
      prompt("Computer wins!")
    end
    break
  end
end

# goodbye
prompt("Thanks for playing! Goodbye.")
