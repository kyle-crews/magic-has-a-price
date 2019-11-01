class TrackMagic::CLI

    def start
        TrackMagic::CLI.main
    end

    def self.main

        puts ""
        puts ""
        puts "################################"

        puts "++++++   TRACKING MAGIC   ++++++"

        puts "################################"
        puts ""
        options = ["View/manage portfolio", "Search for a card price", "Run desktop ticker"]
        puts "---------------------------------"
        puts ""
        puts "select an option below ..."
        puts ""
        options.each.with_index(1) do |option, i|
            puts "  #{i}.  #{option}"
        end
        puts ""
        puts "---------------------------------"
        puts ""
        puts "enter a # : "
        input = gets.chomp
        
            if input == '1'
                puts ""
                puts "View/manage portfolio"
                TrackMagic::Portfolio.list_all_cards
            elsif input == '2'
                puts ""
                puts "Beep"
            elsif input == 'Search for a card price'
                input_name
                input_set
            else input == '3'
                puts ""
                puts "Boop"
            end

        puts ""
        puts ""
        
    end
   
end