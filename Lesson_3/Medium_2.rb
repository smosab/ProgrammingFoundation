Medium_2

Question 1

Answer 1

[52] pry(main)> total_age = 0
=> 0
[53] pry(main)> munsters.each_value {|v| if v["gender"] == "male" then total_age += v["age"] end}
=> {"Herman"=>{"age"=>32, "gender"=>"male"},
 "Lily"=>{"age"=>30, "gender"=>"female"},
 "Grandpa"=>{"age"=>402, "gender"=>"male"},
 "Eddie"=>{"age"=>10, "gender"=>"male"}}
[54] pry(main)> total_age
=> 444


Answer 2

munsters.each do |name, details|
  puts "#{name} is a #{details["age"]} year old #{details["gender"]}"
      end

Answer 3

def tricky_method(a_string_param, an_array_param)
  a_string_param << "rutabaga"
  an_array_param << "rutabaga"
end

[81] pry(main)> puts "My string looks like this now: #{my_string}"
My string looks like this now: pumpkinsrutabaga
=> nil
[82] pry(main)> puts "My array looks like this now: #{my_array}"
My array looks like this now: ["pumpkins", "rutabaga"]


Answer 4

[13] pry(main)> sentence.split.reverse.join(" ")
=> "wall. a on sat Dumpty Humpty"

Answer 5

34

Answer 6

The mischief only mangled a local copy of the original hash because the hash variable "munsters" was not reassigned the new values as it was not referenced within the method itself.

Answer 7

rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

rps(rps(rps("rock", "paper"), "rock" ), "rock")

rps(rps("paper", "rock" ), "rock")

rps("paper", "rock")

"paper"

Answer 8

"yes"

