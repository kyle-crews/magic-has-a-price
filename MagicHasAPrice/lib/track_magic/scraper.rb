#class GatherTheMagic::Scraper

require 'nokogiri'
require 'open-uri'
require 'pry'

class Card

    @@all = {}

    def initialize(name=nil, url=nil, deck=nil)
        @name = name
        @url = url
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new
        @@all 

    def self.get_page
        Nokogiri::HTML(open("http://www.mtgprice.com/sets/Unlimited/Black_Lotus"))
    end


    @doc.search("h2.card-name").text.strip

    def self.name

    data = @doc.search("h2.card-name").text.strip.split
    clean = data.collect {|a| a.delete("&nbsp-")}
    end

    binding.pry
end

doc = Nokogiri::HTML(open('http://www.mtgprice.com/sets/Unlimited/Black_Lotus'))

def name
    @name ||= data = doc.search("h2.card-name").text.strip.split
    data.collect {|a| a.delete("&nbsp-")}
end
