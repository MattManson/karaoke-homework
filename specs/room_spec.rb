require('minitest/autorun')
require('minitest/rg')
require_relative("../room.rb")
require_relative("../guest.rb")
require_relative("../song.rb")

class TestRoom < MiniTest::Test

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

  def test_room_name
    assert_equal("room1", @room1.room_name)
  end

  def test_num_guests
    assert_equal( 0, @room1.num_guests.length)
  end

  def test_check_in
    @room1.check_in(@guest1)
    assert_equal(1,@room1.num_guests.length)
  end

  def test_check_out
    @room1.check_in(@guest1)
    @room1.check_in(@guest2)
    @room1.check_out(@guest1)
    assert_equal(1,@room1.num_guests.length)
  end

  def test_song_playing
    playing = @room1.add_to_playlist(@song1)
    assert_equal("My War by Black Flag", @room1.song_playing(@song1))
  end

  def test_capacity
    people = @room1.how_many_guests(@guests)
    assert_equal(4, people)
  end

  def test_capacity_too_many
    capacity = @room2.check_in(@guest1)
    assert_equal("room full", capacity)
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
