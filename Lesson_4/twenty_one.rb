require 'pry'

def prompt(msg)
  puts "=> #{msg}"
end

SUITS = ["H", "D", "S", "C"]
RANKS = ('2'..'10').to_a + %w(J Q K A)

def initialize_deck
  SUITS.product(RANKS).shuffle
end

def deal_cards(players_cards, dealers_cards, deck)
  2.times do
    players_cards << deck.pop
    dealers_cards << deck.pop
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
  # values.select { |value| value == "A" }.count.times do
  values.count { |value| value == "A" }.times do
    sum -= 10 if sum > 21
  end

  sum
end

def display_opening_cards(players_cards, dealers_cards)
  prompt "Dealing cards..."
  sleep(2)
  prompt "Your cards: #{players_cards} Total value of cards: #{total(players_cards)}"
  prompt "Dealers cards: #{dealers_cards[0]}, [?,?]}"
end

def display_score(players_cards, dealers_cards)
  system "clear"
  prompt "Your cards: #{players_cards} Total value of cards: #{total(players_cards)}"
  prompt "Dealers cards: #{dealers_cards} Total value of cards: #{total(dealers_cards)}"
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

def hit_or_stay?
  answer = ''
  loop do
    prompt "(h)it or (s)tay?"
    answer = gets.chomp.downcase
    break if ["h", "s"].include?(answer)
    prompt "Please enter 'h' or 's'"
  end
  answer
end

def players_turn(players_cards, dealers_cards, deck)
  loop do
    if hit_or_stay? == 'h'
      player_hits(players_cards, deck)
      display_score(players_cards, dealers_cards)
    else break
    end
    break if busted?(players_cards)
  end

  if busted?(players_cards)
    prompt "You busted! Dealer wins!"
    sleep(2)
  else
    puts "You chose to stay!"
    sleep(2)
  end
end

def dealer_hits_or_stays(dealers_cards, players_cards, deck)
  loop do
    break unless total(dealers_cards) <= 17
    prompt "Dealer hits!"
    sleep(2)
    dealer_hits(dealers_cards, deck)
    display_score(players_cards, dealers_cards)
    break if busted?(dealers_cards)
  end

  if busted?(dealers_cards)
    prompt "Dealer busted! You win!"
    sleep(2)
  else
    prompt "Dealer stays..."
    sleep(2)
  end
end

def dealers_turn(dealers_cards, players_cards, deck)
  prompt "Dealers turn!"
  sleep(2)

  dealer_hits_or_stays(dealers_cards, players_cards, deck)
end

def whoiswinner?(players_cards, dealers_cards)
  if !busted?(players_cards) && total(players_cards) > total(dealers_cards)
    prompt "You win!"
  elsif !busted?(dealers_cards) && total(dealers_cards) > total(players_cards)
    prompt "Dealer wins!"
  elsif total(players_cards) == total(dealers_cards)
    prompt "It's a push(draw)!"
  end
end

def playagain?
  prompt "Would you like to play again (y/n)?"
  gets.chomp.downcase.start_with?('y')
end

def welcomemsg
  system 'clear'
  prompt "Welcome to Twenty-One!"
  sleep(1)
end

welcomemsg
loop do
  players_cards = []
  dealers_cards = []

  deck = initialize_deck

  deal_cards(players_cards, dealers_cards, deck)

  display_opening_cards(players_cards, dealers_cards)

  players_turn(players_cards, dealers_cards, deck)

  if !busted?(players_cards)
    dealers_turn(dealers_cards, players_cards, deck)
  end

  whoiswinner?(players_cards, dealers_cards)

  break unless playagain?
end

prompt "Thanks for playing!"
