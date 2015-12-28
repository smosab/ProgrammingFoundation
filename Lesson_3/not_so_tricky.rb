require 'pry'

def not_so_tricky_method(a_string_param, an_array_param)
  binding.pry
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]
  binding.pry
  return a_string_param, an_array_param
  binding.pry
end

my_string = "pumpkins"
my_array = ["pumpkins"]
binding.pry
my_string, my_array = not_so_tricky_method(my_string, my_array)
binding.pry

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"