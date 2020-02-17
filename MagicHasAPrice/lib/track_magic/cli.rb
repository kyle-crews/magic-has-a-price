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
        puts "# : "
        puts ""
        input = gets.chomp
        case
            when input == '1'
                puts ""
                puts "View/manage portfolio"
                puts "-------------------------"
                puts ""
                TrackMagic::Portfolio.display_portfolio
                puts ""
                portfolio_menu
            when input == '2'
                puts ""
                TrackMagic::Card.
            when input == 'Search for a card price'
                input_name
                input_set
            when input == '3'
                puts ""
                puts "Boop"
        end

        puts ""
        puts ""
        
    end

    def self.portfolio_menu

        options = ["Add a card", "Search for card", "Delete card"]

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
        puts "# : "
        puts ""
        input = gets.chomp
        case
        when input == '1'
            puts ""
            puts "Add a card"
            puts "-------------------------"
            puts ""
            puts "please enter card name:"
            input_n = gets.chomp
            puts ""
            puts "please enter card set:"
            puts ""
            input_s = gets.chomp
            puts ""
            puts "please enter purchase price:"
            puts ""
            input_p = "$"+gets.chomp
            TrackMagic::Portfolio.add_new_card(input_n, input_p, input_s)
            puts ""
            puts "=> successfully added #{input_n} of #{input_s} @ #{input_p}"
            puts ""
            puts "--------------------------------"
            TrackMagic::Portfolio.display_portfolio
            puts "--------------------------------"
        when input == '2'
            puts ""
            puts "Search for card"
            puts "-------------------------"
            puts ""
            puts "which card are you looking for?"
            @i_name = gets.chomp.to_s
            TrackMagic::Card.all.select {|s| s.name == @i_name}
        else input == '3'
            puts ""
            puts "Delete card"
            puts "-------------------------"
        end

        puts ""
        puts ""

    end
end
