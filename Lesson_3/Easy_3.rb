# Easy_3

# Question 1

# Show an easier way to write this array:

# flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

# Solution 1

# [1] pry(main)> flintstones = %w{ Fred Barney Wilma Betty BamBam Pebbles}
# => ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

# Question 2

# How can we add the family pet "Dino" to our usual array:

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Solution 2

# [3] pry(main)> flintstones << "Dino"
# => ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles", "Dino"]

# Question 3

# In the previous exercise we added Dino to our array like this:

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# flintstones << "Dino"
# We could have used either Array#concat or Array#push to add Dino to the family.

# How can we add multiple items to our array? (Dino and Hoppy)

# Solution 3

# [6] pry(main)> flintstones << %w(Dino Hoppy)
# => ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles", ["Dino", "Hoppy"]]
# [7] pry(main)> flintstones.flatten

# Question 4

# Shorten this sentence:

# advice = "Few things in life are as important as house training your pet dinosaur."
# ...remove everything starting from "house".

# Review the String#slice! documentation, and use that method to make the return value "Few things in life are as important as ". But leave the advice variable as "house training your pet dinosaur.".

# As a bonus, what happens if you use the String#slice method instead?

# Solution 4

# [14] pry(main)> advice.slice!(/house.*/)
# => "house training your pet dinosaur."
# [15] pry(main)> advice
# => "Few things in life are as important as "
# [16] pry(main)>

# Question 5

# Write a one-liner to count the number of lower-case 't' characters in the following string:

# statement = "The Flintstones Rock!"

# Solution 5

# [19] pry(main)> statement.count "t"
# => 2

# Question 6

# Back in the stone age (before CSS) we used spaces to align things on the screen. If we had a 40 character wide table of Flintstone family members, how could we easily center that title above the table with spaces?

# title = "Flintstone Family Members"

# Solution 6

# => "       Flintstone Family Members        "
# [35] pry(main)>


