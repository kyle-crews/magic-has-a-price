require_relative "./card"
require "pry"

class Portfolio

    def self.list_all_cards
        Card.all
    end
  
    def self.number_of_cards
        Card.all.length 
    end
  
    def remove(remove_card)
        remove_song.select do |card|
            @@all.delete(card)
        end
    end
  
    def play_all
        @@all.select do |card|
            card.play
        end
    end
  
    def self.display
        Card.all.collect {|data| data}
    end

    def self.display_spread
        display[0].spread
    end

    def self.search_by_name(name)
        Card.all.select {|s| s.name == name}
    end

    def self.name
        Card.name
    end

Card.new("lotus","$25","$15","card magic","$10", "origin")
Card.new("black","$15","$10","card magic","$5", "pro")

binding.pry

end
  
=begin

card.all

my_playlist = Playlist.new(one_by_one, world_so_cold, going_under)

lying_from_you = Song.new("Lying From You", "Linkin Park")
angels = Song.new("Angels", "Within Temptation")

my_playlist.add(lying_from_you, angels)
p my_playlist.track_number == 5
going_under.play
my_playlist.remove(angels)
p my_playlist.includes?(lying_from_you) == true
my_playlist.play_all
my_playlist.display
=end