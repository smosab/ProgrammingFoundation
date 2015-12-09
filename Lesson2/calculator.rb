# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i() != 0
end

prompt("Welcome to Calculator! Enter you name: ")

name = ''
loop  do
name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Make sure to use a valid name")
  else
    break
  end

end


loop do

  number1 = ''
  loop do 
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp()  

    if valid_number?(number1)
      break
    else
      prompt("Hmm..that doesn't look like a valid number. Please try again.")
    end

  end
  #Kernel.puts(number1.inspect)
  #Kernel.puts("The number is: " + number1 + "!")

  number2 = ''
  loop  do
  prompt("What's the second number?")
  number2 = Kernel.gets().chomp()

  if valid_number?(number2)
      break
    else
      prompt("Hmm..that doesn't look like a valid number. Please try again.")
    end

  end


  prompt("What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide")
  operator = Kernel.gets().chomp()

# if operator == '1'
#   result = number1.to_i() + number2.to_i()
# elsif operator == '2'
#   result = number1.to_i() - number2.to_i()
# elsif operator == '3'
#   result = number1.to_i() * number2.to_i()
# else
#   result = number1.to_f() / number2.to_f()
# end


  result = case operator
            when '1'
            number1.to_i() + number2.to_i()
            when '2'
            result = number1.to_i() - number2.to_i()
            when '3'
            result = number1.to_i() * number2.to_i()
            when '4'
            number1.to_f() / number2.to_f()
          end



# Kernel.puts(result)

prompt("The result is: #{result}")

prompt("Do you want to perform another operation? (Y/N)")
answer = Kernel.gets().chomp()

break unless answer.upcase().start_with?('Y') 
  
end

prompt("Thank you for using the calculator!")

