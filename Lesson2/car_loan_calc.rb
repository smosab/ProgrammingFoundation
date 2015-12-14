# Car Loan Calculator
# require 'pry'

def prompt(message)
  Kernel.puts("=> #{message}")
end

def integer?(input)
  input.to_i.to_s == input
  # if num == 0.0
  #   true
  # else
  # num.to_i() != 0.0
  # end
end

def number?(input)
  integer?(input) || float?(input)
end

def float?(input)
  input.to_f.to_s == input
end
prompt("Welcome to the car loan calculator!")

prompt("What is the Make and Model of your vehicle?")

car = ''
  loop do
    car = Kernel.gets().chomp()
    if car.empty?()
      prompt("you must enter a make and model.")
    else
      break
    end
  end

loan = ''
  loop do
    prompt("What is the loan amount for the #{car}?")
    loan = Kernel.gets().chomp()
    if number?(loan)
      break
    else
      prompt("Please enter a valid loan amount")
    end
  end

apr = ''
  loop do
    prompt("What is the APR on the #{loan} loan amount?")
    apr = Kernel.gets().chomp()
    if number?(apr)
      break
    else
      prompt("Please enter a valid APR")
    end
  end

  dur_months = ''
  loop do
    prompt("What is the duration of your loan (in months)?")
    dur_months = Kernel.gets().chomp()
    if number?(dur_months)
      break
    else
      prompt("Please enter a valid duration")
    end
  end
  # binding.pry
  monthly_interest_rate = (apr.to_f/100)/12
  # puts("The monthly rate is #{monthly_interest_rate}%")

  # P = monthly_payment
  # L = Loan amount
  # c = monthly rate
  # n = loan duration in months

  # P = L[c(1 + c)n]/[(1 + c)n - 1]

  # monthly_payment = loan[monthly_interest_rate(1 + monthly_interest_rate)dur_months]/[(1+monthly_interest_rate)dur_months - 1]

  monthly_payment = loan.to_f*(
    monthly_interest_rate*((1+monthly_interest_rate)**dur_months.to_f)
                              )/
    (((1+monthly_interest_rate)**dur_months.to_f)-1)

  puts("You're monthly payment is $#{monthly_payment}")



