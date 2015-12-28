Medium_2

Question 1

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

Figure out the total age of just the male members of the family.

Solution 1

[52] pry(main)> total_age = 0
=> 0
[53] pry(main)> munsters.each_value {|v| if v["gender"] == "male" then total_age += v["age"] end}
=> {"Herman"=>{"age"=>32, "gender"=>"male"},
 "Lily"=>{"age"=>30, "gender"=>"female"},
 "Grandpa"=>{"age"=>402, "gender"=>"male"},
 "Eddie"=>{"age"=>10, "gender"=>"male"}}
[54] pry(main)> total_age
=> 444

Question 2


Given this previously seen family hash, print out the name, age and gender of each family member:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
...like this:

(Name) is a (age) year old (male or female).

Solution 2

munsters.each do |name, details|
  puts "#{name} is a #{details["age"]} year old #{details["gender"]}"
      end

Question 3


How can we refactor this exercise to make the result easier to predict and easier for the next programmer to maintain?

Solution 3

def tricky_method(a_string_param, an_array_param)
  a_string_param << "rutabaga"
  an_array_param << "rutabaga"
end

[81] pry(main)> puts "My string looks like this now: #{my_string}"
My string looks like this now: pumpkinsrutabaga
=> nil
[82] pry(main)> puts "My array looks like this now: #{my_array}"
My array looks like this now: ["pumpkins", "rutabaga"]


