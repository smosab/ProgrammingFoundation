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

card_values = {"Ace" => 1, "King" => 10, "Queen" => 10, "Jack" => 10, "Two" => 2, "Three" => 3, "Four" => 4, "Five" => 5, "Six" => 6, "Seven" => 7, "Eight" => 8, "Nine" => 9, "Ten" => 10}

ace_one = 1
ace_eleven = 11

suit_hearts = [['H', '2'], ['H', '3'], ['H', '4'], ['H', '5'], ['H', '6'], ['H', '7'], ['H', '8'], ['H', '9'], ['H', '10'], ['H', 'K'], ['H', 'Q'], ['H', 'J'], ['H', 'A']]

suit_spade = [['S', '2'], ['S', '3'], ['S', '4'], ['S', '5'], ['S', '6'], ['S', '7'], ['S', '8'], ['S', '9'], ['S', '10'], ['S', 'K'], ['S', 'Q'], ['S', 'J'], ['S', 'A']]

suit_club = [['C', '2'], ['C', '3'], ['C', '4'], ['C', '5'], ['C', '6'], ['C', '7'], ['C', '8'], ['C', '9'], ['C', '10'], ['C', 'K'], ['C', 'Q'], ['C', 'J'], ['C', 'A']]

suit_diamond = [['D', '2'], ['D', '3'], ['D', '4'], ['D', '5'], ['D', '6'], ['D', '7'], ['D', '8'], ['D', '9'], ['D', '10'], ['D', 'K'], ['D', 'Q'], ['D', 'J'], ['D', 'A']]

players_cards = []

dealers_cards =  []

ace = 0

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


# Player turn
answer = nil
loop do
  puts "hit or stay?"
  answer = gets.chomp
  break if answer == 'stay' || busted?   # the busted? method is not shown
end

if busted?
  # probably end the game? or ask the user to play again?
else
  puts "You chose to stay!"  # if player didn't bust, must have stayed to get here
end

# ... continue on to Dealer turn
# hit until the total is at least 17
loop do
  break unless sum of cards >= 17
  hits || busted?
end

if busted?
  # probably end the game? or ask the user to play again?
else
  puts "You chose to stay!"  # if player didn't bust, must have stayed to get here
end
