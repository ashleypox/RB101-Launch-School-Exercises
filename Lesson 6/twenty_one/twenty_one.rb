# constants
CARDS_NO_SUIT = {
  'Ace' => [1, 11],
  '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
  '6' => 6, '7' => 7, '8' => 8, '9' => 9, '10' => 10,
  'Jack' => 10,
  'Queen' => 10,
  'King' => 10
}

LINE = '========================================='

# methods
def prompt(str)
  puts "==> #{str}"
end

def sort_into_suits(suit_str, cards) # new hash, labels with suit
  cards.transform_keys do |key|
    key + suit_str
  end
end

def initialize_deck
  hearts = sort_into_suits(' of hearts', CARDS_NO_SUIT)
  spades = sort_into_suits(' of spades', CARDS_NO_SUIT)
  diamonds = sort_into_suits(' of diamonds', CARDS_NO_SUIT)
  clubs = sort_into_suits(' of clubs', CARDS_NO_SUIT)

  hearts.merge(spades, diamonds, clubs)
end

def remove_suit(card)
  suits = [' of hearts', ' of spades', ' of diamonds', ' of clubs']
  card.gsub(Regexp.union(*suits), '')
end

def deal_card!(deck)
  card = deck.keys.sample
  deck.delete(card)

  card
end

def to_value_array(cards)
  int_arr = []
  ace_arr = []

  cards.each do |card|
    card_key = remove_suit(card)

    CARDS_NO_SUIT.each do |k, v|
      if card_key == 'Ace'
        ace_arr << v
      elsif k == card_key
        int_arr << v
      end
    end
  end

  [int_arr, ace_arr]
end

def value_of(cards)
  int_arr, ace_arr = to_value_array(cards)

  if int_arr.sum <= 10 && ace_arr.flatten.include?(1)
    int_arr.sum + 11
  elsif int_arr.sum > 10 && ace_arr.flatten.include?(1)
    int_arr.sum + 1
  else
    int_arr.sum
  end
end

def bust?(cards)
  value_of(cards) > 21
end

def evaluate_win(player_cards, comp_cards)
  if bust?(player_cards)
    if bust?(comp_cards) == false
      'Computer wins.' 
    elsif bust?(comp_cards)
      'Both bust.'
    end
  elsif bust?(comp_cards)
    'Player wins!'
  elsif value_of(player_cards) == value_of(comp_cards)
    "It's a draw."
  elsif value_of(player_cards) > value_of(comp_cards)
    'Player wins!'
  else
    'Computer wins.'
  end
end

# main
loop do
  # new game set up
  deck = initialize_deck
  player_cards = []
  comp_cards = []

  comp_cards << deal_card!(deck)
  comp_cards << deal_card!(deck)

  player_cards << deal_card!(deck)
  player_cards << deal_card!(deck)

  prompt "Dealer has: #{comp_cards[0]} and an unknown card."
  prompt "You have: #{player_cards.join(', ')}."
  puts LINE

  # player hit-or-stay
  loop do
    prompt "Hit or stay? (type h or s)"
    answer = gets.chomp.downcase

    if answer == 'h'
      player_cards.append(deal_card!(deck))
      prompt "You were dealt #{player_cards[-1]}."
      prompt "You are now holding: #{player_cards.join(', ')}"
      puts LINE

      if bust?(player_cards)
        prompt "Bust!"
        puts LINE
        break
      end
    elsif answer == 's'
      break
    end
  end

  # computer hit-or-stay
  loop do
    if value_of(comp_cards) <= 17
      comp_cards << deal_card!(deck)
    else
      break
    end
  end

  # game results
  prompt "Computer is holding: #{comp_cards.join(', ')}"
  prompt "Computer score is #{value_of(comp_cards)}."
  prompt "Player score is #{value_of(player_cards)}."
  prompt evaluate_win(player_cards, comp_cards)
  puts LINE

  # play again?
  prompt "Do you want to play again?"
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt "Thanks for playing Twenty-one! Goodbye!"
