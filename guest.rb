class Guest

  attr_accessor :name, :wallet, :fav_song

  def initialize(name, wallet, fav_song)
    @name = name
    @wallet = wallet
    @fav_song = fav_song
  end

  def fav_song1(guest)
    if @playlist[0].name == guest.fav_song
      return "OI OI OI!"
    else
      return "not my favourite tune"
    end
  end

end
