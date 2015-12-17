# Rock Paper Scissors Spock Lizard# Rock Paper Scissors

# VALID_CHOICES = %w(rock paper scissors spock lizard)
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

loop do # main loop

  def display_result(player, computer)
    if win?(player, computer)
      prompt("You won!")
    elsif win?(computer, player)
      prompt("Computer won!")
    else prompt("It's a tie!")
    end
  end

  # def test_method
  #   prompt('test message')
  # end
  # test_method

  def prompt(message)
    Kernel.puts("=> #{message}")
  end

  # choice = ''




    # VALID_CHOICES.each do |c|
    #   if  choice[0] != c[0]
    #   then prompt("That's not a valid choice")
    #     else
    #   end
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

  # if (choice == 's')
  #     prompt("1 for Spock or 2 for scissors")
  #     choice = Kernel.gets().chomp()
  #     break
  #     else





  computer_choice = VALID_CHOICES.sample

  Kernel.puts("You chose #{choice} the computer chose #{computer_choice}")

  display_result(choice, computer_choice)

  prompt("Do you want to play again?(y/n)")
  answer = Kernel.gets().chomp()

  break unless answer.downcase().start_with?('y')

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
