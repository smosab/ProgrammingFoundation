
def titlesize!(title)
  title.capitalize!
  count = title.length
  loop do
  title[count].upcase
  count -= 1
  break if count == 0
  end
end



title = "this is a title"
titlesize!(title)


# capitalize the first word of the string
# is the next character a space?
# if so capitalize the next character
# end
