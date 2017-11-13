require('minitest/autorun')
require('minitest/rg')
require_relative("../room.rb")
require_relative("../guest.rb")
require_relative("../song.rb")
require_relative("../bar_tab.rb")

class TestGuest < MiniTest::Test
  def setup
    @guest1 = Guest.new("Henry Rollins", 1300, "My War")
    @guest2 = Guest.new("Ian MacKaye", 2500, "Straight Edge")
    @guest3 = Guest.new("Jello Biafra", 3000, "Holiday In Cambodia")
    @guest4 = Guest.new("HR", 1000, "I against I")
    @guests = [@guest1, @guest2, @guest3, @guest4]
    @room1 = Room.new("room1", [], 4)
    @room2 = Room.new("room2", @guests, 4)
    @song1 = Song.new("My War", "Black Flag")
    @song2 = Song.new("Straight Edge", "Minor Threat")
  end

  def test_customer_name
    assert_equal("Henry Rollins", @guest1.name)
  end

  def test_customer_has_money
    assert_equal(2500, @guest2.wallet)
  end

  def test_customer_fav_song
    assert_equal("Holiday In Cambodia", @guest3.fav_song)
  end

  def test_fav_song_is_playing
    playing = @room1.add_to_playlist(@song1)
    response = @room1.fav_song1(@guest1)
    assert_equal("OI OI OI!", response)
  end

  def test_fav_song_not_playing
    playing = @room1.add_to_playlist(@song2)
    response = @room1.fav_song1(@guest1)
    assert_equal("not my favourite tune", response)
  end


end
