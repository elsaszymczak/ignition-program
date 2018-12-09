# Line 1: a Morse sequence with a maximum length L
# Line 2: an integer N corresponding to the number of words in the dictionary
# The N following lines: one word from the dictionary per line. Each word has a maximum length M and only appears once in the dictionary.
require 'pry-byebug'


# every element of dictionary are uniq

MORSE = {
  "A" => ".-",
  "B" => "-...",
  "C" => "-.-.",
  "D" => "-..",
  "E" => ".",
  "F" => "..-.",
  "G" => "--.",
  "H" => "....",
  "I" => "..",
  "J" => ".---",
  "K" => "-.-",
  "L" => ".-..",
  "M" => "--",
  "N" => "-.",
  "O" => "---",
  "P" => ".--.",
  "Q" => "--.-",
  "R" => ".-.",
  "S" => "...",
  "T" => "-",
  "U" => "..-",
  "V" => "...-",
  "W" => ".--",
  "X" => "-..-",
  "Y" => "-.--",
  "Z" => "--.."
}



