class Card
  attr_accessor :name, :price, :low_price, :low_price_vendor, :spread

  @@all = []

  def initialize(name, price, low_price, low_price_vendor, spread)
    @name = name
    @price = price
    @low_price = low_price
    @low_price_vendor = low_price_vendor
    @spread = spread
    @@all << self
  end

  def self.all
    @@all
  end

end



class TrackMagic::Card

  # ||= ... if @variable is undefined or falsey, then evaluate @doc and set @variable to the result

def self.card_details

    @card_details.color
    @card_details.mana_cost
    @card_details.type_class
    @card_details.card_text
    @card_details.artist
    @card_details.rarity
    @card_details..number

end

=end