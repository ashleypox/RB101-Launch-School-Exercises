# constants
CARDS_NO_SUIT = {
  'Ace' => [1, 11],
  '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
  '6' => 6, '7' => 7, '8' => 8, '9' => 9, '10' => 10,
  'Jack' => 10,
  'Queen' => 10,
  'King' => 10
}

# methods

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

def value_of(cards)
  int_arr = []

  for card in cards
    card_key = remove_suit(card)
    p card_key
    CARDS_NO_SUIT.each {|key, value| (int_arr << value) if (key == card_key)}
  end

  int_arr.sum
end

def bust?(cards)
  true if value_of(cards) > 21
end

def evaluate_win(player_cards, comp_cards)
  
end

# main
loop do
  deck = initialize_deck
  player_cards = []
  comp_cards = []

  comp_cards << deal_card!(deck)
  comp_cards << deal_card!(deck)

  player_cards << deal_card!(deck)
  player_cards << deal_card!(deck)

  puts "Dealer has: #{comp_cards[0]} and an unknown card."
  puts "You have: #{player_cards}."
  puts "Hit or stay? (type h or s)"
  answer = gets.chomp.downcase

  if answer == 'h'
    player_cards.append(deal_card!(deck))
    puts "You were dealt #{player_cards[-1]}."
    p player_cards
    break if bust?(player_cards)
  end
end







=begin
2. Deal cards to player and dealer
  - cant deal the same card twice until deck is re-initalized!
  - need to remove cards from playable deck as they are selected

3. Player turn: hit or stay
  - repeat until bust or "stay"

4. If player bust, dealer wins.

5. Dealer turn: hit or stay
  - repeat until total >= 17

6. If dealer bust, player wins.

7. Compare cards and declare winner.
=end
