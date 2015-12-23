# Question 1

# numbers = [1, 2, 2, 3]
# numbers.uniq

# puts numbers
# p numbers

# expected: => [1, 2, 3, 3]


# Question 2

# The difference between '?' and '!'.
# A. The two are simply naming conventions. The first just usually suggests the method called is a query type which returns a boolean type, while the second usually means the method will have some destructive or important effect on the object being manipulated.

# scenarios:
# 1. what is != and where should you use it?
# A. Refered to as 'Bang equal' or 'Not equal", this operator is used to eveluate/determine if two values are unequal.

# 2. put ! before something, like !user_name.
# A. When used this way, returns the opposite boolean value.

# 3. put ! after something, like words.uniq!
# A. Using the exclamation mark this way usually makes the method destructive.

# 4. put ? before something
# A. Not sure of this one.

# 5. put ? after something
# A. Indicates that a method returns a boolean value

# 6. put !! before something, like !!user_name
# A. Return the original boolean value?

# Question 3
# Replace the word "important" with "urgent" in this string:
# advice = "Few things in life are as important as house training your pet dinosaur."
# advice.sub!("important", "urgent")

# Question 4
# The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

# numbers = [1, 2, 3, 4, 5]
# What does the follow method calls do (assume we reset numbers to the original array between method calls)?

# A.
# numbers.delete_at(1) # This deletes the item from the array at the stated index.
# numbers.delete(1) # This deletes the item that matches the value passed in.


# Question 5

# Programmatically determine if 42 lies between 10 and 100.

# A.
# [93] pry(main)> 42.between?(10,100)

# Question 6

# Starting with the string:

# famous_words = "seven years ago..."
# show two different ways to put the expected "Four score and " in front of it.

# A.
# [110] pry(main)> famous_words = "Four score and " << famous_words
# [113] pry(main)> famous_words.prepend("Four score and ")

# Question 7

# A.
# [122] pry(main)> eval(how_deep)
# => 42

# Question 8

# A.
# flintstones.flatten!

# Question 9

# A.
# Given the hash below

# flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
# Turn this into an array containing only two elements: Barney's name and Barney's number


# [141] pry(main)> flintstones.each {|key, value| if key != "Barney" flintstones.
# [146] pry(main)> flintstones.delete_if {|key, value| key != "Barney" }

# Question 10

# Given the array below

# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# Turn this array into a hash where the names are the keys and the values are the positions in the array.

# A.

# [155] pry(main)> new_hash = Hash.new
# => {}
# [156] pry(main)> flintstones.each do |name|
# [156] pry(main)*   new_hash[name] = flintstones.find_index(name)
# [156] pry(main)* end
