Answer 1

Local variabe undefined error will be raised

Answer 2

puts greetings # => 'hi'

Answer 3

A)
#=> One is: one
#=> two is: two
#=> three is: three

B)
#=> One is: one
#=> two is: two
#=> three is: three

C)
#=> One is: two
#=> two is: three
#=> three is: one

Answer 4

# Easy way:

require 'SecureRandom'

def uuid
  SecureRandom.uuid
end

uuid
=> "6ec3d795-355a-4d26-a542-34170028d258"

# Hard way:


uuid = []

numeric = (0..9).to_a
alpha = ('a'..'f').to_a

alphanumeric = []
alphanumeric = [alpha, numeric].flatten

first_hex = []
result = 0
x = 8
loop do
  while x > 0
    first_hex << alphanumeric.shuffle.sample
    x -= 1
  end
  result = first_hex.join =~ /[0-9]/
  break unless result.nil?
end
first_hex = first_hex.join
uuid << first_hex

second_hex = []
result = 0
x = 4
loop do
  while x > 0
    second_hex << alphanumeric.shuffle.sample
    x -= 1
  end
  result = second_hex.join =~ /[0-9]/
  break unless result.nil?
end
second_hex = second_hex.join
uuid << second_hex

third_hex = []
result = 0
x = 4
loop do
  while x > 0
    third_hex << alphanumeric.shuffle.sample
    x -= 1
  end
  result = third_hex.join =~ /[0-9]/
  break unless result.nil?
end
third_hex = third_hex.join
uuid << third_hex

fourth_hex = []
result = 0
x = 4
loop do
  while x > 0
    fourth_hex << alphanumeric.shuffle.sample
    x -= 1
  end
  result = fourth_hex.join =~ /[0-9]/
  break unless result.nil?
end
fourth_hex = fourth_hex.join
uuid << fourth_hex

fifth_hex = []
result = 0
x = 12
loop do
  while x > 0
    fifth_hex << alphanumeric.shuffle.sample
    x -= 1
  end
  result = fifth_hex.join =~ /[0-9]/
  break unless result.nil?
end
fifth_hex = fifth_hex.join
uuid << fifth_hex

uuid = uuid.join('-')

puts uuid

Answer 5

