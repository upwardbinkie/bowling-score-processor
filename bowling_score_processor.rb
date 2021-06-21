require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/pinfall'
require_relative 'lib/score'

game = Game.new
pinfall = Pinfall.new
score = Score.new
game_data = game.load_game

print "Frame\t\t"

(1..10).each do |i|
    print "#{i}\t\t"
end

print "\n"

game_data.each do |player|
    puts player.name
    
    pinfalls = player.pinfalls
    
    frames = player.set_frames(pinfalls)

    pinfall.print_pinfalls(frames)

    player_score = score.process_score(frames)

    score.print_score(player_score)
end
