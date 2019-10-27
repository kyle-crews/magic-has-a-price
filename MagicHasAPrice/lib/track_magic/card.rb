require 'pry'
require_relative "./Scraper"

class Card
  attr_accessor :name, :price, :low_price, :low_price_vendor, :spread, :set

  @@all = []

  def initialize(name, price, low_price, low_price_vendor, spread, set)
    @name = name
    @price = price
    @low_price = low_price
    @low_price_vendor = low_price_vendor
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
  
  def self.set
    Scraper.set
  end

  def self.low_price
    Scraper.low_price
  end

  def self.spread
    Scraper.spread
  end

  def self.card_details
    Scraper.number
    Scraper.color
    Scraper.mana_cost
    Scraper.card_text
    Scraper.artist
    Scraper.rarity
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