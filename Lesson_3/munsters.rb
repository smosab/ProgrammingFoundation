munsters_description = "The Munsters are creepy in a good way."

x = 0
loop do
  if x == 0
    puts munsters_description
  elsif x == 1
    puts munsters_description.swapcase
  elsif x == 2
    puts munsters_description.downcase
  elsif x == 3
    puts munsters_description.upcase
  else
    break
  end
  x += 1
end



