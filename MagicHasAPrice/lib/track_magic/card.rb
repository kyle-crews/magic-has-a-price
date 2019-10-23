Class GatherTheMagic::Card

attr_accessor :name, :url, :high_price, :current_price, :buy_url, :card_details

    @@all = []

    def initialize(name, url)
        @name = name
        @url = url
        @@all << self
    end

    def self.all
        @@all
    end

      # ||= ... if @variable is undefined or falsey, then evaluate @doc and set @variable to the result


    def self.high_price
        @high_price ||= @doc.search("tr.tbody-title").text.strip
    end

    def self.current_price
    end

    def self.current_price
    end

    def self.card_details

        @card_details.color
        @card_details.mana_cost
        @card_details.type_class
        @card_details.card_text
        @card_details.artist
        @card_details.rarity
        @card_details..number

    end

    def doc
        @doc ||= Nokogiri::HTML(open(self.url))
    end

end

def self.search

    data = search("h2.card-name").text.strip
    data

end





