# Rock Paper Scissors game
VALID_CHOICES = %w(rock paper scissors)

# methods 
def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
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

# main loop 
loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("Please select a valid choice.")
    end
  end

  computer_choice = ['rock', 'paper', 'scissors'].sample

  display_results(choice, computer_choice)
  prompt("You chose #{choice}, and the computer chose #{computer_choice}.")

  prompt("Do you want to play again? Enter 'y' for yes.")
  answer = gets.chomp
  break unless answer.downcase == 'y'
end

prompt("Thanks for playing! Goodbye.")
