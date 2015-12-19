# Rock Paper Scissors Spock Lizard

require 'pry'
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
      prompt("You won this round!")
    elsif win?(computer, player)
      prompt("The Computer won this round!")
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
    prompt("Choose one (first letter ok): #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()
   if VALID_CHOICES.none? {|word| word[0] == choice[0]}
    prompt("That's not a valid choice")
  else
    break
    end
  end


  if (choice == 's')
        prompt("1 for Spock or 2 for scissors")
        choice = Kernel.gets().chomp()
  end
    choice = case choice
              when '2'
                then 'scissors'
              when '1'
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
    prompt("The computer won!")
  end
  break if player_score == 5 || computer_score == 5

  # My version:
  # loop do

  #   prompt("Choose one: rock, paper, scissors")

  #   choice = Kernel.gets().chomp()
  #   choices = %w(rock paper scissors)
  #   computer_choice = choices.shuffle[1]

  #   prompt("The computer's choice is #{computer_choice}")

  #   if (choice == 'rock' and computer_choice == 'rock') then prompt("Tie!")
  #   elsif (choice =='paper' and computer_choice == 'rock') then prompt("You win!")
  #   elsif (choice == 'scissors' and computer_choice == 'rock') then prompt("You lose!")

  #   elsif (choice =='rock' and computer_choice == 'paper') then prompt("You lose!")
  #   elsif (choice =='paper' and computer_choice == 'paper') then prompt("Tie!")
  #   elsif (choice =='scissors' and computer_choice == 'paper') then prompt("You win!")

  #   elsif (choice =='rock' and computer_choice == 'scissors') then prompt("You win!")
  #   elsif (choice =='paper' and computer_choice == 'scissors') then prompt("You lose!")
  #   elsif (choice =='scissors' and computer_choice == 'scissors') then prompt("Tie")
  #   end

  #   prompt("Play again?(y/n)")
  #   play_again = Kernel.gets().chomp()

  #   break if play_again.upcase == 'N'

end # main loop end
