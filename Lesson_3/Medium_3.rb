
Answer 3

My string looks like this now: pumpkins
#Ruby is reassigining the value"rutabaga" to a new object withing the method with the '+=' operator.

My array looks like this now: ["pumpkins", "rutabaga"]
#Ruby is using the same object.


Answer 4

My string looks like this now: rutubaga
My array looks like this now: ["pumpkins"]

Answer 5

def color_valid(color)
  case color
  when "blue"
    true
  when "green"
    true
  else
    false
  end
end
