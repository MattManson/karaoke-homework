require('pry')
class Room

  attr_accessor :room_name, :num_guests, :playlist

  def initialize(room_name, people_in_room)
    @room_name = room_name
    @num_guests = people_in_room
    @playlist = []
    @capacity = 4
  end

  def check_in(guest)
    if @num_guests.length == @capacity
      return "room full"
      #   # guest.each {|i| @num_guests << i} - this also works by flattening received array
      #   @num_guests.push *guests
      #   return @num_guests.length
      # end
      else
        @num_guests.push guest
        guest.wallet -=50
      end
  end

  def check_out(guest)
    @num_guests.delete(guest)
  end

  def add_to_playlist(song)
    @playlist << song
  end

  def song_playing(song)
    return "#{@playlist[0].name} by #{@playlist[0].artist}"
  end

  def how_many_guests(guests)
    # if @num_guests.length <=4
      guests.each {|i| @num_guests << i}
      # @num_guests.push *guests - this also works by flattening received array
      return @num_guests.length
    # elsif @num_guests >=4
    #   return "room full"
    # end
  end



end
# a = [1,2,3]
# [4,5,6].each {|i| a << i }
