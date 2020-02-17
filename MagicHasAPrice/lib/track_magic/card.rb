class TrackMagic::Card
  
  attr_accessor :name, :price, :purchase_price, :set

  @@all = []

  def initialize(name, set, purchase_price)
    @name = name
    @purchase_price = purchase_price
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
    @card = gets.chomp.downcase
    @input_card = @card.split(/ |\_/).map(&:capitalize).join(" ")
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
      @set = gets.chomp.downcase
      @input_set = @set.split(/ |\_/).map(&:capitalize).join(" ")
      if @input_set.include?(' ')
          @input_set.gsub!(" ", "_")
      else
          @input_set
      end
  end

  def self.input_url
      name = card_name
      set = card_set
      @entered_url = "https://www.mtgprice.com/sets/#{set}/#{name}"
      
      if @entered_url.include?(' ')
        @entered_url.gsub!(" ", "_")
      else
        @entered_url
      end
      @entered_url
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

  def self.search_by_name
    puts ""
    puts ""
    input_url
    TrackMagic::Scraper.get_page(@url)
  end

end