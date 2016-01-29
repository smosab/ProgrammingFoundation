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

SUITS = ["H", "D","S","C"]
RANKS = ('2'..'10').to_a + %w(J Q K A)

def initialize_deck
  SUITS.product(RANKS).shuffle
end


# players_cards = initialize_player_cards(players_cards, deck)
# dealers_cards = initialize_dealer_cards(dealers_cards, deck)

def deal_cards(players_cards, dealers_cards, deck)
  2.times do
    players_cards << deck.pop
    dealers_cards << deck.pop
  end
end

def whoiswinner?(dealers_cards, players_cards)
  if busted?(players_cards) and !busted?(dealers_cards)
  "dealer"
  elsif busted?(dealers_cards) and !busted?(players_cards)
    "player"
  elsif total(players_cards) > total(dealers_cards)
    "player"
  else
    "dealer"
  end
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end


def display_opening_cards(players_cards, dealers_cards)
system "clear"
# binding.pry
prompt "Welcome to Twenty-One!"
sleep(1)
prompt "Dealing cards..."
sleep(2)
prompt "Players cards: #{players_cards} Total value of cards: #{total(players_cards)}"
prompt "Dealers cards: #{dealers_cards[0]}, [?,?]}"

end

def display_score(players_cards, dealers_cards)
  prompt "players cards: #{players_cards} Total value of cards: #{total(players_cards)}"
  prompt "dealers cards: #{dealers_cards} Total value of cards: #{total(dealers_cards)}"
end

def busted?(cards)
  total(cards) > 21
end

def dealer_hits(dealers_cards, deck)
  dealers_cards << deck.pop
end

def player_hits(players_cards, deck)
  players_cards << deck.pop
end

def players_turn(players_cards, deck)
  loop do
  puts "hit or stay?"
  answer = gets.chomp
  if answer == 'hit'
    player_hits(players_cards, deck)
    else break
  end
  break if busted?(players_cards)
  end

  if busted?(players_cards)
  # probably end the game? or ask the user to play again?
  prompt "You busted!"
  sleep (2)
  else
  puts "You chose to stay!"  # if player didn't bust, must have stayed to get here
  sleep(2)
# # binding.pry
  end
end

def dealers_turn(dealers_cards, deck)
  # hit until the total is at least 17
  prompt "Dealers turn!"
  sleep(2)
  loop do

    break unless total(dealers_cards) <= 17
    prompt "Dealer hits!"
    sleep(2)
    dealer_hits(dealers_cards, deck)
    prompt "The total of the dealers cards is #{total(dealers_cards)}"
          # # binding.pry
    break if busted?(dealers_cards)
    end

    if busted?(dealers_cards)
    # probably end the game? or ask the user to play again?
    prompt "Dealer busted!"
    sleep(2)
    else
    prompt "Dealer stays."
  end
end

def playagain?
  prompt "Would you like to play again (y/n)?"
  answer = gets.chomp
end

answer = nil

players_cards = []
dealers_cards = []

loop do

  deck = initialize_deck

  deal_cards(players_cards, dealers_cards, deck)

  display_opening_cards(players_cards, dealers_cards)

  players_turn(players_cards, deck)

  # ... continue on to Dealer turn
  dealers_turn(dealers_cards, deck)

  display_score(players_cards, dealers_cards)
  prompt "#{whoiswinner?(dealers_cards, players_cards)} wins!"
  break if playagain? == 'n'
  prompt "Thanks for playing!"

end

