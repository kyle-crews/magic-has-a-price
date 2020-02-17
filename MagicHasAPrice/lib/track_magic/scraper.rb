require_relative './card.rb'


class TrackMagic::Scraper

    @doc = @entered_url

    def self.get_url
        @entered_url = TrackMagic::Card.input_url
    end

    def self.get_page
        Nokogiri::HTML(open(@entered_url))
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
        @rarity ||= card_details[28].gsub('&nbsp&nbspCard', '')
    end
binding.pry
end