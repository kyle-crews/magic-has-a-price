require 'pry'

require_relative "./scraper"

class Card
  attr_accessor :name, :price, :purchase_price, :spread, :set

  @@all = []

  def initialize(name, price, purchase_price, spread, set)
    @name = name
    @price = price
    @purchase_price = purchase_price
    @spread = spread
    @set = set
    @@all << self
  end

  def self.all
    @@all
  end

  def self.name
    Scraper.name
  end

  def self.price
    Scraper.price
  end

  def self.low_price
    Scraper.low_price
  end

  def self.low_price_vendor
    Scraper.low_price_vendor
  end

  def self.spread
    Scraper.spread
  end

  def self.set
    Scraper.set
  end

  def self.purchase_price
    input_price = "$3"
    input_price
  end

  def self.info

   card_details = {
    
    :number => Scraper.number,
    :color => Scraper.color,
    :mana_cost => Scraper.mana_cost,
    :text => Scraper.text,
    :artist => Scraper.artist,
    :rarity => Scraper.rarity
  }
  card_details
  end

end


=begin
class TrackMagic::Card

  

def self.card_details

    @card_details.type_class
    @card_details.card_text
    @card_details.artist
    @card_details.rarity
    @card_details..number

end
=end