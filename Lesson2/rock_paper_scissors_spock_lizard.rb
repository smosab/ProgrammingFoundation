# Rock Paper Scissors Spock Lizard

# require 'pry'
VALID_CHOICES = %w(rock paper scissors spock lizard)

def win?(first, second)
  (first == 'scissors' && second == 'paper') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'spock' && second == 'rock') ||
    (first == 'rock' && second == 'scissors')
end

player_score = 0
computer_score = 0

puts "Welcome to Rock Paper Scissors Spock Lizard! First to score 5 wins!"
loop do # main loop
  def display_result(player, computer)
    if win?(player, computer)
      prompt("You won this round...")
    elsif win?(computer, player)
      prompt("The Computer won this round...")
    else prompt("It's a tie!")
    end
  end

  def prompt(message)
    Kernel.puts("=> #{message}")
  end

  prompt("Your score: #{player_score}")
  prompt("The computer's score: #{computer_score}")

  choice = ''
  loop do
    # prompt("Choose one (first letter ok): #{VALID_CHOICES.join(', ')}")
    prompt("Choose one (r)ock (p)aper (sc)issors (s)pock (l)izard")
    choice = Kernel.gets().chomp()
    if VALID_CHOICES.none? { |word| word[0] == choice || 'sc' == choice }
      prompt("That's not a valid choice")
    else
      break
    end
  end

  choice = case choice
           when 'sc'
            then 'scissors'
           when 's'
            then 'spock'
           when 'r'
            then 'rock'
           when 'p'
            then 'paper'
           when 'l'
            then 'lizard'
           end

  computer_choice = VALID_CHOICES.sample

  Kernel.puts("You chose #{choice}, the computer chose #{computer_choice}")

  display_result(choice, computer_choice)

  computerwins = win?(choice, computer_choice)
  playerwins = win?(computer_choice, choice)

  if computerwins == true
    player_score += 1
  elsif playerwins == true
    computer_score += 1
  end

  if player_score == 5
    prompt("You won the game!")
  elsif computer_score == 5
    prompt("The computer won the game!")
  end
  break if player_score == 5 || computer_score == 5
end # main loop end
