require_relative("room.rb")
require_relative("guest.rb")
require_relative("song.rb")
require_relative("bar_tab.rb")

puts "Welcome to the R0B0T R0CK K4R40K3 B4R! please tell us your full name:"
name = gets.chomp

puts "Please input maximum value of your bar tab for this evening. all fees and drinks will be charged to this tab up to the limit you set."
wallet = gets.chomp.to_i
if wallet >=1000
  puts "Alright! thats a Rockstar amount of money for drinks!"
elsif (50..999).include?(wallet)
  puts "low on funds? No Worries. entry is only $50 tonight, you'll be fine."
elsif (0..49).include?(wallet)
  puts "Sorry cheapskate. entry is $50."
end

puts "So, #{name.split.map(&:capitalize)*' '}, got a special song you love to sing?"
fav_song_name = gets.chomp.downcase!
puts "Hmm, that might be in our library, if i can find it i'll put it on your playlist first tonight. Who's the artist?"
artist = gets.chomp.downcase

fav_song = Song.new(fav_song_name, artist)
guest = Guest.new(name, wallet, fav_song)
puts "Awesome i found the original studio version, i'll add it as your first track so you get to sing it sober."
puts "press any key to express enjoyment"
enjoyment = gets.chomp
if enjoyment == "Whoo"
  puts "slow down, jeez, you're not even drunk"
elsif enjoyment == "fuck yeah!"
  puts "this is a family venue, keep your enjoyment civil"
elsif enjoyment == "OI OI"
  puts "TRU-PUNX FOR LYFE OI OI OI"
else
  puts "damn you know how to party"
end
puts "shall we find you a karaoke room? (yes/no; don't go apeshit)"
reply = gets.chomp
if reply == "yes"
puts "seems you don't have a reservation, i'll check and see what rooms are free"
puts "...."
puts "*typing sounds*"
puts "whirr beep boop"
puts ".........."
puts "Looks like room 2 is taken tonight, but room 1 is free. you can have 3 more guests, when they arrive we'll check them in the same as you"
room1 = Room.new("room1", [guest], 4)
room1.playlist.push(fav_song)
elsif reply == "no"
  puts "cool.. uuh so.. maybe go home then?"
elsif reply == "don't go apeshit"
  puts "get out, SECURITY!!!"

end

# if room1.playlist[0].name == guest.fav_song
#   puts "OI OI OI!"
# else
#   puts "not my favourite tune"
# end
# puts "nice!"
