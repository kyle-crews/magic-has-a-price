require 'pry'

class Ticker

    def self.start_ticker(cards)
        #t,i=gets.chop*81,0
        t,i=cards*81,0
        loop{system'cls'
            $><<t[(i=(i+1)%80)..i+79]
        sleep 0.1}
    end

@cards = "Kinsbaile Cavalier, Morningtide	@ $11.05 |+4.23%| - Jace, Magic Origins @ $45.94 |+2.99%| -
Muraganda Petroglyphs, Future Sight	@ $6.49 |+2.30%| - Bloodstained Mire, Khans of Tarkir @ $20.98 |+1.99%| - 
Misty Rainforest, Zendikar @ $60.96 |+1.76%|
Liliana, Eldritch Moon @ $50.0 |-6.49%| - Monastery Mentor, Fate Reforged @ $23.99 |-4.39%|
Sliver Legion, Future Sight	@ $81.82 |-4.16%| - Knight Exemplar, M11	@ $11.65 |-3.30%| - Urza, Modern Horizons @ $39.17 |-3.22%| -
Thassa, Theros @ $19.48 |+9.23%| - Thoughtseize, Lorwyn	@ $40.97 |+9.19%| - Academy Ruins, Time Spiral @ $27.97 |+8.48%|
- Jace, Magic Origins	@ $45.94 |+8.16%| - Liliana, Eldritch Moon @ $50.0 |+7.53%| - Oko, Throne of Eldraine	@ $39.98 |-8.75%|
- Liliana of the Veil, Innistrad @ $65.17 |-7.83%| - Rhys the Redeemed, Shadowmoor @ $25.94 |-5.04%| - 
Mox Opal, Scars of Mirrodin @ $104.99 |-5.00%| - Urza, Modern Horizons @ $39.17 |-4.73%|"

binding.pry

end

=begin

=> run in powershell

$s=(Read-Host)*180;for(){Write-Host($s.substring(($i=++$i%80),80)+"`r")-N -F R -B 0;sleep -m 99}

Expanded:
$test = (Read-Host) * 180
for () {
    Write-Host ($text.substring(($i=++$i%80), 80)+"`r") -NoNewLine -ForegroundColor Red -BackgroundColor Black
    sleep -Miliseconds 99
}

$l=($s=Read-Host).Length;for(){Write-Host(($s*160).substring(($i=++$i%$l),80)+"`r")-N -F R -B 0;sleep -m 99}

$s=' '*80+(read-host)+' '*80;for(){write-host($s.Substring(($i=++$i%($s.length-80)),80)+"`r")-N -F R -B 0;sleep -m 99}

=end