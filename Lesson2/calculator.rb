# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
# puts MESSAGES.inspect

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

def float?(input)
  input.to_f.to_s == input
end

def number?(input)
  integer?(input) || float?(input)
end

def operator_to_message(op)
  case op
  when '1'
    MESSAGES['add']
  when '2'
    MESSAGES['subtract']
  when '3'
    MESSAGES['multiply']
  when '4'
    MESSAGES['divide']
  end
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt(MESSAGES['hello'])
prompt("#{name}!")

loop do
  number1 = ''
  loop do
    prompt(MESSAGES['number_1'])
    number1 = Kernel.gets().chomp()
    if number?(number1)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  number2 = ''
  loop do
    prompt(MESSAGES['number_2'])
    number2 = Kernel.gets().chomp()
    if number?(number2)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  operator = ''
  loop do
    prompt(MESSAGES['operator_prompt'])
    # prompt(operator_prompt)
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['operators'])
    end
  end

  result =  case operator
            when '1'
              number1.to_f() + number2.to_f()
              # number1.to_i() + number2.to_i()
            when '2'
              number1.to_f() - number2.to_f()
            when '3'
              number1.to_f() * number2.to_f()
            when '4'
              number1.to_f() / number2.to_f()
            end

  prompt("#{operator_to_message(operator)}...")
  puts MESSAGES['calc_status']
  # prompt()
  prompt(MESSAGES['result'])
  prompt("#{result}")

  prompt(MESSAGES['continue'])
  answer = Kernel.gets().chomp()

  break unless answer.upcase().start_with?('Y')
end

prompt(MESSAGES['Thank_you'])
