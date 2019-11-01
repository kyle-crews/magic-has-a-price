class TrackMagic::Card
  
  attr_accessor :name, :price, :purchase_price, :spread, :set, :url

  @@all = []

  def initialize(name=nil, price=nil, set=nil)
    @name = name
    @price = price
    @set = set
    @@all << self
  end

  def self.all
    @@all
  end

  def self.card_name
    puts ""
    puts "Card name, please ..."
    puts ""
    @input_card = gets.chomp.downcase
    if @input_card.include?(' ')
        @input_card.gsub!(" ", "_")
    else
        @input_card
    end
end

def self.card_set
    puts ""
    puts "Card set, please ..."
    puts ""
    @input_set = gets.chomp.downcase
    if @input_set.include?(' ')
        @input_set.gsub!(" ", "_")
    else
        @input_set
    end
end

def self.input_url
    name = card_name
    set = card_set
    @url = "https://www.mtgprice.com/sets/#{set}/#{name}"
    
    if @url.include?(' ')
      @url.gsub!(" ", "_")
    else
      @url
    end
end

def self.search_url(set, name)
    @url = "https://www.mtgprice.com/sets/#{set}/#{name}"
    @url
end

  def self.name
    @name ||= TrackMagic::Scraper.name
  end

  def self.price
    @price ||= TrackMagic::Scraper.price
  end

  def self.low_price
    @low_price ||= TrackMagic::Scraper.low_price
  end

  def self.low_price_vendor
    @low_price_vendor ||= TrackMagic::Scraper.low_price_vendor
  end

  def self.spread
    @spread ||= TrackMagic::Scraper.spread
  end

  def self.set
    @set ||= TrackMagic::Scraper.set
  end

  def self.purchase_price
    puts ""
    puts "Please enter the purchase price ..."
    @input_price ||= "$" + gets.chomp
  end

  def self.url
    if @url != nil
          @url
    else @url == nil
      puts ""
      puts "error: no url located ... please run method to create url"
    end
  end

  def self.info

   card_details = {
    
    :number => TrackMagic::Scraper.number,
    :color => TrackMagic::Scraper.color,
    :mana_cost => TrackMagic::Scraper.mana_cost,
    :text => TrackMagic::Scraper.text,
    :artist => TrackMagic::Scraper.artist,
    :rarity => TrackMagic::Scraper.rarity
  }
  card_details
  end

end