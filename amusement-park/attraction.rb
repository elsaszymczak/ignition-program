require 'pry-byebug'

class Attraction
  attr_accessor :capacity, :attraction_limit, :sizes_of_groups

  def initialize(attributes = {})
    @attraction_limit = attributes[:attraction_limit]
    @capacity = attributes[:capacity]
    @sizes_of_groups = attributes[:sizes_of_groups]
    ride
  end

  def ride
    money = 0
    rides_count = 0
    #check that we do not go over the attraction limit per day
    while @attraction_limit > 0
      # Getting the number of people for this ride
      people_riding = @capacity - check_capacity(@capacity, @sizes_of_groups)
      # Calculating the money we got for this ride ( 1 ride = 1 dirham)
      money += (people_riding * 1)
      # Incrementing the count for the rides
      rides_count += 1
      # Decrementing the attraction limit
      @attraction_limit -= 1
      puts state_of_attraction(@attraction_limit)
    end
    puts "You made #{money} dirham today for #{rides_count} rides "
  end

  def state_of_attraction(attraction_limit)
    puts "There are #{attraction_limit} rides left today"
  end

  def state_of_ride(capacity)
    puts "There are #{capacity} places left for this ride!"
  end

  def how_many_people_for_next_ride(sizes_of_groups)
    puts "#{sizes_of_groups.first} people want to join this ride"
  end

  def check_capacity(capacity, sizes_of_groups)
    # Checking that the next group in line can fit in the next ride and if
    # they can, add them to the ride
    while sizes_of_groups.first <= capacity
      # Checking how many people want to join the next ride
      how_many_people_for_next_ride(sizes_of_groups)
      # Adding the group and decrementing the capacity of the next ride
      capacity -= sizes_of_groups.first
      # Moving the second group to the first position and the first group to the last
      sizes_of_groups.insert(-1, sizes_of_groups.delete_at(0))
      # Checking the remaining capacity of the next ride
      state_of_ride(capacity)
    end
    # Checking how many people want to join the next ride
    how_many_people_for_next_ride(sizes_of_groups)
    puts "You are too many to join this ride, sorry!"
    return capacity
  end
end



