require('minitest/autorun')
require('minitest/rg')
require_relative("../room.rb")
require_relative("../guest.rb")
require_relative("../song.rb")
require_relative("../bar_tab.rb")

class TestSong < MiniTest::Test

  def setup
    @song1 = Song.new("My War", "Black Flag")
    @song2 = Song.new("Straight Edge", "Minor Threat")
  end

  def test_song_name
    assert_equal("Straight Edge", @song2.name)
  end

  def test_song_artist
    assert_equal("Black Flag", @song1.artist)
  end

end
