#class GatherTheMagic
#TrackMagic::

require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

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

    # ||= ... if @variable is undefined or falsey, then evaluate @doc and set @variable to the result
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
        @artist.gsub("Rarity:", '')
    end

    def self.rarity
        card_details[28].gsub('&nbsp&nbspCard', '')
    end

    def start
        get_page
        card_details
        main
    end

    def self.main

        puts ""
        puts ""
        puts "################################"

        puts "++++++   TRACKING MAGIC   ++++++"

        puts "################################"
        puts "
,-------------------------------.
|  PickleRick                   |
| .---------------------------. |
| |                   ,.._.--'| |
| |   ,.  .   ``-  ,-'&,$. `. | |
| |`.   ..       ,',&&,$$$.  .| |
| |  \`--.___,--','&'/$$$$$$$$ | |
| |   `-._  ___,'   ,,$$$'    | |
| |      ,-' \\ \  \,    ,::::   | |
| | __,-' ,:::::::::::::::::::| |
| |',:::::::::::::::::::::::::| |
| `---------------------------' |
| Land                      7   |
| .---------------------------. |
| |          _,-.             | |
| |        ,'`-..`.)          | |
| |         ,--', );          | |
| |        (   (,',,-,        | |
| |         `--.__.-'         | |
| |___________________________| |
|       #GatherTheMagic
|dev.kylecrews@gmail.com 338/350|
`------------------------------Gr  
        "
        options = ["View portfolio", "Search for a card price", "Manage Portfolio"]
        puts "---------------------------------"
        puts ""
        puts "select an option below ..."
        puts ""
        options.each.with_index(1) do |option, i|
            puts "  #{i}.  #{option}"
        end
        puts ""
        puts "---------------------------------"
        input = gets.chomp

        puts "test"


    end
    main

    def self.display_data

        puts "#{self.name}:"
        puts "set: #{self.set} - price: #{self.price} - low_price: #{self.low_price} - spread: $#{self.spread}"
        puts "number: #{self.number} - color: #{self.color} - name: #{self.name}"
    end
    
binding.pry

end