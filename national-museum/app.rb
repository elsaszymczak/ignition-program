require_relative "decoder"

puts "Welcome to the National Museum"
print "             ---              "

puts "What sequence of morse would you like to analyse?"
print "> "
sequence = gets.chomp

puts "What words are in the dictionary? Hello, world, ... (Every word should have a miximum length of 20 characters)"
print "> "
dictionary_string = gets.chomp
dictionary = dictionary_string.split(",")
number_of_words = dictionary.count

decoder = Decoder.new(sequence: sequence, dictionary: dictionary, number_of_words: number_of_words)
puts "There are #{decoder.possible_messages} possible messages for this sequence"

