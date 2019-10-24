#class GatherTheMagic::Scraper

require 'nokogiri'
require 'open-uri'
require 'pry'

class Card

    @@all = {}

    @doc = Nokogiri::HTML(open("http://www.mtgprice.com/sets/Unlimited/Black_Lotus"))
    
    def initialize(name=nil, url=nil, set=nil)
        @name = name
        @url = url
        @@all << self
    end

    def self.all
        @@all
    end

    def self.get_page
        Nokogiri::HTML(open("http://www.mtgprice.com/sets/Unlimited/Black_Lotus"))
    end
    
    def self.name_price_deck
        get_page.search("h2.card-name").text.strip.split
    end

    def self.name
        @name ||= name_price_deck[0..1].join(" ")
    end

    def self.price
        @price ||= name_price_deck[2].delete("&nbsp-")
    end

    def self.set
        @set ||= name_price_deck[4].split("Set:&nbsp")[1]
    end

    def self.low_price
        @low_price_vendor ||= @doc.xpath("//div[@id='graphControls']").text.split[6..7].join(" ")
        
        @low_price ||= @doc.xpath("//div[@id='graphControls']").text.split[8].delete("()")
    end

    def self.spread
        @spread ||= (price.delete("$").to_i - low_price.delete("$").to_i)
    end

    binding.pry

end
    
=begin
    def self.details

        card_details = {
            :color => "Art"
            :mana_cost => "0"
            :text => "Sacrifice Black Lotus: Add three mana of any one color to your mana pool."
            :artist => "Christopher Rush"
            :rarity => "R"
            :number => "233/302"
        }

        card_details
    end

    def self.best_buy_list
        @best_buy_list ||=
    end

    Card Kingdom - $13999.99
=end
