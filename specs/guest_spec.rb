require('minitest/autorun')
require('minitest/rg')
require_relative("../room.rb")
require_relative("../guest.rb")
require_relative("../song.rb")

class TestGuest < MiniTest::Test
  def setup
    @guest1 = Guest.new("Henry Rollins", 1300, "My War")
    @guest2 = Guest.new("Ian MacKaye", 2500, "Straight Edge")
    @guest3 = Guest.new("Jello Biafra", 3000, "Holiday In Cambodia")
    @guest4 = Guest.new("HR", 1000, "I against I")
    @guests = [@guest1, @guest2, @guest3, @guest4]
    @room1 = Room.new("room1", [])
    @room2 = Room.new("room2", @guests)
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

end
