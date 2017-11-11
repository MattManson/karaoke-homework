require('pry')
class Room

  attr_accessor :room_name, :num_guests, :capacity, :playlist

  def initialize(room_name, people_in_room, capacity)
    @room_name = room_name
    @num_guests = people_in_room
    @capacity = capacity
    @playlist = []
  end

  def check_in(guest)
    if @num_guests.length >= @capacity
      return "room full"
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
    guests.each {|i| @num_guests << i}
    return @num_guests.length
  end

  def fav_song1(guest)
    if @playlist[0].name == guest.fav_song
      return "OI OI OI!"
    else
      return "not my favourite tune"
    end
  end



end
