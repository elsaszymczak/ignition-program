  require_relative "morse"
  require 'pry-byebug'

class Decoder
  attr_reader :sequence, :dictionary

  def initialize(attributes={})
    raise ArgumentError.new("Sequence must be smaller than 100000 characters") unless attributes[:sequence].length < 100000
    raise ArgumentError.new("The dictionary can only contain a maximum of 100000 words") unless attributes[:number_of_words] < 100000
    # raise ArgumentError.new("Every dictionary's word has a maximum length of 20 characters") unless @dictionary_words_length < 20

    @sequence = attributes[:sequence]
    @dictionary = attributes[:dictionary]
    # @dictionary_words_length = attributes[:dictionary_words_length]
    @number_of_words = attributes[:number_of_words]

    possible_messages
  end

  def encode(dictionary)
    #transform every words of the dictionary in morse
    dictionary.map do |word|
      letters_array = word.split("").map do |letter|
        #retrieve every letter in morse from the morse hash
        MORSE[letter]
      end
      letters_array.join
    end
  end

  def sequence_array(sequence)
    #transform the sequence in an array of morse letters
    sequence.split("")
  end

  def possible_messages
    # Initiating the count and the matching sequence
    count = 0
    matching_sequence = []

    # Getting the sequence array
    sequence_array = sequence_array(@sequence)
    # Getting the dictionary in morse
    morse_dictionary = encode(@dictionary)

      # Iterate over the sequence array
      sequence_array.each do |morse_letter|
        #For each morse letter, put them in an array
        matching_sequence << morse_letter
        #transform the array in a string
        @sequence = matching_sequence.join

        #Iterate over the dictionary in morse
        morse_dictionary.each do |morse_word|
          # For each morse word, check if the word matches the new sequence
          if morse_word == @sequence
            # If it does, increment count
            count += 1
          end
        end
      end
    return count
  end
end

