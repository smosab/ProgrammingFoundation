# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
# puts MESSAGES.inspect

LANGUAGE = 'en'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

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
    messages('add', LANGUAGE)
    # MESSAGES['add']
  when '2'
    messages('subtract', LANGUAGE)
  when '3'
    messages('multiply', LANGUAGE)
  when '4'
    messages('divide', LANGUAGE)
  end
end

prompt(messages('welcome', LANGUAGE))

name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(messages('valid_name', LANGUAGE))
  else
    break
  end
end

prompt(messages('hello', LANGUAGE))
prompt("#{name}!")

loop do
  number1 = ''
  loop do
    prompt(messages('number_1', LANGUAGE))
    number1 = Kernel.gets().chomp()
    if number?(number1)
      break
    else
      prompt(messages('valid_number', LANGUAGE))
    end
  end

  number2 = ''
  loop do
    prompt(messages('number_2', LANGUAGE))
    number2 = Kernel.gets().chomp()
    if number?(number2)
      break
    else
      prompt(messages('valid_number', LANGUAGE))
    end
  end

  operator = ''
  loop do
    prompt(messages('operator_prompt', LANGUAGE))
    # prompt(operator_prompt)
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages('operators', LANGUAGE))
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
  prompt(messages('result', LANGUAGE))
  prompt("#{result}")

  prompt(messages('continue', LANGUAGE))
  answer = Kernel.gets().chomp()

  break unless answer.upcase().start_with?('Y')
end

prompt(messages('Thank_you', LANGUAGE))
