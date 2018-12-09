require_relative 'attraction'

puts "What is the capacity of the attraction?"
print "> "
capacity = gets.chomp.to_i
puts "What is the limit per day of the attraction?"
print "> "
attraction_limit = gets.chomp.to_i
puts "How many groups are in the queue?"
print "> "
number_of_groups = gets.chomp.to_i
puts "How many people are in each groups, starting from the first: 3, 5, .."
print "> "
# Getting a string and spliting it into an array of strings
array_of_strings = gets.chomp.split(',')
#Transforming it in an array of integers
sizes_of_groups = array_of_strings.map do |string|
  string.to_i
end

Attraction.new(capacity: capacity, attraction_limit: attraction_limit, sizes_of_groups: sizes_of_groups)
