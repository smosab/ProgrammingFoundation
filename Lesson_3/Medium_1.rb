Medium 1

Question 1

For this exercise, write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:

The Flintstones Rock!
 The Flintstones Rock!
  The Flintstones Rock!

Solution 1

[35] pry(main)> tfr = "The Flintstones Rock!"
=> "The Flintstones Rock!"
[36] pry(main)> 10.times {puts tfr.prepend(" ")}
 The Flintstones Rock!
  The Flintstones Rock!
   The Flintstones Rock!
    The Flintstones Rock!
     The Flintstones Rock!
      The Flintstones Rock!
       The Flintstones Rock!
        The Flintstones Rock!
         The Flintstones Rock!
          The Flintstones Rock!

Question 2

Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"
ex:

{ "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

Solution 2

[14] pry(main)> freq_hash = {}
=> {}
[15] pry(main)> tfr.each_char {|c| freq_hash[c] = tfr.count(c) }
=> "The Flintstones Rock"
[16] pry(main)> freq_hash
=> {"T"=>1, "h"=>1, "e"=>2, " "=>2, "F"=>1, "l"=>1, "i"=>1, "n"=>2, "t"=>2, "s"=>2, "o"=>2, "R"=>1, "c"=>1, "k"=>1}

Question 3

The result of the following statement will be an error:

puts "the value of 40 + 2 is " + (40 + 2)
Why is this and what are two possible ways to fix this?

Solution 3

[1] pry(main)> puts "the value of 40 + 2 is #{40+2}"
the value of 40 + 2 is 42

[2] pry(main)> puts "the value of 40 + 2 is " + (40 + 2).to_s
the value of 40 + 2 is 42

Question 4

What happens when we modify an array while we are iterating over it? What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
endnumbers = [1, 2, 3, 4]
What would be output by this code?

numbers.each do |number|
  p number
  numbers.pop(1)
end

Solution 4
1
3
----------
1
2


Question 5

Alan wrote the following method, which was intended to show all of the factors of the input number:

def factors(number)
  dividend = number
  divisors = []
  begin
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0
  divisors
end
# Alyssa noticed that this will fail if you call this with an input of 0 or a negative number and asked Alan to change the loop. How can you change the loop construct (instead of using begin/end/until) to make this work? Note that we're not looking to find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.

Solution 5

  def factors(number)
  dividend = number
  divisors = []
  (1..number).each do |n|
    divisors << dividend / n if dividend % n == 0
  end
    divisors
end

factors(10)


Bonus 1

What is the purpose of the number % dividend == 0 ?

A. To ensure that only whole numbers are passed into the array.

Bonus 2

What is the purpose of the second-to-last line in the method (the divisors before the method's end)?

To return the array.





