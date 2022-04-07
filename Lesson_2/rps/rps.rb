# Rock Paper Scissors game
VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  puts("=> #{message}")
end

def display_results(player, computer)
  if (player == 'rock' && computer == 'scissors') ||
     (player == 'paper' && computer == 'rock') ||
     (player == 'scissors' && computer == 'paper')
    prompt("You win!")
  elsif (computer == 'rock' && player == 'scissors') ||
        (computer == 'paper' && player == 'rock') ||
        (computer == 'scissors' && player == 'paper')
    prompt("You lost.")
  else
    prompt("It's a tie!")
  end
end

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

