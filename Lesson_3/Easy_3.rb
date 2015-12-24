Easy_3

Question 1

Show an easier way to write this array:

flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

Solution 1

[1] pry(main)> flintstones = %w{ Fred Barney Wilma Betty BamBam Pebbles}
=> ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

Question 2

How can we add the family pet "Dino" to our usual array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

Solution 2

[3] pry(main)> flintstones << "Dino"
=> ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles", "Dino"]