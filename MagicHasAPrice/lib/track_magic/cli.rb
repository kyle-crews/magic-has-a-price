class TrackMagic::CLI

    def start
        get_page
        card_details
        main
    end

    def self.main

        puts ""
        puts ""
        puts "################################"

        puts "++++++   TRACKING MAGIC   ++++++"

        puts "################################"
        puts "
,-------------------------------.
|  PickleRick                   |
| .---------------------------. |
| |                   ,.._.--'| |
| |   ,.  .   ``-  ,-'&,$. `. | |
| |`.   ..       ,',&&,$$$.  .| |
| |  \`--.___,--','&'/$$$$$$$$ | |
| |   `-._  ___,'   ,,$$$'    | |
| |      ,-' \\ \  \,    ,::::   | |
| | __,-' ,:::::::::::::::::::| |
| |',:::::::::::::::::::::::::| |
| `---------------------------' |
| Land                      7   |
| .---------------------------. |
| |          _,-.             | |
| |        ,'`-..`.)          | |
| |         ,--', );          | |
| |        (   (,',,-,        | |
| |         `--.__.-'         | |
| |___________________________| |
|       #GatherTheMagic
|dev.kylecrews@gmail.com 338/350|
`------------------------------Gr  
        "
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
        input = gets.chomp
        
            if input == '1'
                puts "View/manage portfolio"
            elsif input == '2'
                puts "Beep"
            elsif input == 'Search for a card price'
                input_name
                input_set
            else input == '3'
                puts "Boop"
            end

        puts ""
        puts ""
        
    end
    main
   
end