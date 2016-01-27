require 'pry'
# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

# Figure out a data structure to contain the "deck" and the "player's cards" and "dealer's cards". Maybe a hash? An array? A nested array?

# card_values = {"Ace" => 1, "King" => 10, "Queen" => 10, "Jack" => 10, "Two" => 2, "Three" => 3, "Four" => 4, "Five" => 5, "Six" => 6, "Seven" => 7, "Eight" => 8, "Nine" => 9, "Ten" => 10}

# ace_one = 1
# ace_eleven = 11
# ace = 0

def prompt(msg)
  puts "=> #{msg}"
end

prompt("Welcome to Twenty-One!")

# suit_hearts = [['H', '2'], ['H', '3'], ['H', '4'], ['H', '5'], ['H', '6'], ['H', '7'], ['H', '8'], ['H', '9'], ['H', '10'], ['H', 'K'], ['H', 'Q'], ['H', 'J'], ['H', 'A']]

# suit_spade = [['S', '2'], ['S', '3'], ['S', '4'], ['S', '5'], ['S', '6'], ['S', '7'], ['S', '8'], ['S', '9'], ['S', '10'], ['S', 'K'], ['S', 'Q'], ['S', 'J'], ['S', 'A']]

# suit_club = [['C', '2'], ['C', '3'], ['C', '4'], ['C', '5'], ['C', '6'], ['C', '7'], ['C', '8'], ['C', '9'], ['C', '10'], ['C', 'K'], ['C', 'Q'], ['C', 'J'], ['C', 'A']]

# suit_diamond = [['D', '2'], ['D', '3'], ['D', '4'], ['D', '5'], ['D', '6'], ['D', '7'], ['D', '8'], ['D', '9'], ['D', '10'], ['D', 'K'], ['D', 'Q'], ['D', 'J'], ['D', 'A']]

deck = [['H', '2'], ['H', '3'], ['H', '4'], ['H', '5'], ['H', '6'], ['H', '7'], ['H', '8'], ['H', '9'], ['H', '10'], ['H', 'K'], ['H', 'Q'], ['H', 'J'], ['H', 'A'],['S', '2'], ['S', '3'], ['S', '4'], ['S', '5'], ['S', '6'], ['S', '7'], ['S', '8'], ['S', '9'], ['S', '10'], ['S', 'K'], ['S', 'Q'], ['S', 'J'], ['S', 'A'],['C', '2'], ['C', '3'], ['C', '4'], ['C', '5'], ['C', '6'], ['C', '7'], ['C', '8'], ['C', '9'], ['C', '10'], ['C', 'K'], ['C', 'Q'], ['C', 'J'], ['C', 'A'],['D', '2'], ['D', '3'], ['D', '4'], ['D', '5'], ['D', '6'], ['D', '7'], ['D', '8'], ['D', '9'], ['D', '10'], ['D', 'K'], ['D', 'Q'], ['D', 'J'], ['D', 'A']]

players_cards = []

dealers_cards =  []


def return_game_result

end

def display_result

end


def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]

  values = cards.map { |card| card[1] }

  sum = 0

  values.each do |value|
    if value != 'A' && sum <= 10 && value.to_i == 0 # J, Q, K
        sum += 10
      elsif value == 'A' && sum <= 10
          sum += 11
        elsif value == 'A' && sum >10
          sum += 1
        else
        sum += value.to_i
    end
  end

  sum
end

def value_of_players_cards(players_cards)
  total(players_cards)
end

def display_cards(players_cards, dealers_cards)
prompt "players cards: #{players_cards}. Total value of cards: #{value_of_players_cards(players_cards)}"
prompt "dealers cards: #{dealers_cards[0]}."
end

def initialize_player_cards(players_cards, deck)
  players_cards = deck.sample(2)
end

def initialize_dealer_cards(dealers_cards, deck)
  dealers_cards = deck.sample(2)
end

def busted?(players_cards)
  total(players_cards) > 21
end



# Player turn
answer = nil
players_cards = initialize_player_cards(players_cards, deck)
dealers_cards = initialize_dealer_cards(dealers_cards, deck)

loop do
    display_cards(players_cards, dealers_cards)
    puts "hit or stay?"
    answer = gets.chomp
    players_cards << deck.sample
    break if answer == 'stay' || busted?(players_cards)   # the busted? method is not shown
    # binding.pry
    value_of_players_cards(players_cards)
end

if busted?(players_cards)
  # probably end the game? or ask the user to play again?
  prompt "You busted!"
  else
  puts "You chose to stay!"  # if player didn't bust, must have stayed to get here
end

# ... continue on to Dealer turn
# hit until the total is at least 17
loop do
  display_cards(players_cards, dealers_cards)
  break unless total(dealers_cards) >= 17 #undefined local variable or method `cards' for main:Object (NameError)

  break if busted?(dealers_cards)
end

if busted?(dealers_cards)
  # probably end the game? or ask the user to play again?
  prompt "Dealer busted!"
else  prompt "Dealer stays"
end

determine the winner
display_result


