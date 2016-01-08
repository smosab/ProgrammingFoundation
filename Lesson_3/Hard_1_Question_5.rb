require 'pry'

def dot_separated_ip_address?(input_string)
dot_separated_words = input_string.split(".")
# binding.pry
  if dot_separated_words.size == 4 then
    while dot_separated_words.size > 0 do
      word = dot_separated_words.pop
      if !is_a_number?(word)
      puts "The IP address is invalid"
      end
      break if !is_a_number?(word)
    end
    # binding.pry
  else
  puts "The IP address has an incorrect number of components"
  end
return true
end


def is_a_number?(input)
  input == input.to_i.to_s
end


dot_separated_ip_address?("12.34.678.98.4")



