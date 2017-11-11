class Guest

  attr_accessor :name, :wallet, :fav_song

  def initialize(name, wallet, fav_song)
    @name = name
    @wallet = wallet
    @fav_song = fav_song
  end

  
  # add song to playlist
  # add guest to room
  # if song at position [0] on playlist == guest fave song
  # return "fuck yeah thats my jam!"

end
