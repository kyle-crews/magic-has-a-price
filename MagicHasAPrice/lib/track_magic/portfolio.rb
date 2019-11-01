class TrackMagic::Portfolio

    # returns list of all cards currently in portfolio
    def self.list_all_cards
        TrackMagic::Card.all
    end

    # returns all card names currently in portfolio
    def self.list_all_card_names
        @all_card_names = list_all_cards.collect {|card| card.name}
    end
    
    # returns all card prices currently in portfolio
    def self.list_all_card_prices
        @all_card_prices = list_all_cards.collect {|card| card.price}
    end

    # returns all card sets currently in portfolio
    def self.list_all_card_sets
        @all_card_sets = list_all_cards.collect {|card| card.set}
    end

    # returns the number of cards currently in portfolio
    def self.number_of_cards
        TrackMagic::Card.all.length 
    end
  
    def self.display
        puts "name: #{list_all_card_names}"
        puts "set: #{list_all_card_sets}"
        puts "price: #{list_all_card_prices}"
    end

    def self.display_spread
        display[0].spread
    end

    def self.search_by_name(name)
        TrackMagic::Card.all.select {|s| s.name == name}
    end

TrackMagic::Card.new("lotus","$25", "origin")
TrackMagic::Card.new("black","$15", "pro")
TrackMagic::Card.new(TrackMagic::Card.name, TrackMagic::Card.price, TrackMagic::Card.set)

binding.pry

end
  

=begin

        puts "card set:"
        @input_set = gets.chomp.downcase
        puts ""
        puts ""

        puts "purchase_price:"
        @input_price = gets.chomp
        puts ""
        puts ""

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