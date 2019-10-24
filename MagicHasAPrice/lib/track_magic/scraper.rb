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

    def self.card_details
        @details ||= @doc.xpath("//table[@class='txt-small align-left']").text.strip.split
    end

    def self.number
        @number ||= card_details.last
    end

    def self.color
        @color ||= card_details[2].delete("&nbsp&nbspMana")
    end

    def self.mana_cost
        @mana_cost ||= card_details[4].delete("&nbsp&nbspType")
    end

    def self.text
        @text ||= card_details[10..23].join(" ").split(".")[0]
    end

    def self.artist
        @artist ||= card_details[26..27].join(" ")
        artist.delete([16..-1])
    end

    def self.rarity
    end

    binding.pry

end