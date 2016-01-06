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

8.times do
  first_hex << alphanumeral.sample
  first_hex = first_hex.join
end

uuid << first_hex
uuid << second_hex

uuid = uuid.join(".")