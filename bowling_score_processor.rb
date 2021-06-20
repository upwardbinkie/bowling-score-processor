require_relative 'lib/game'
require_relative 'lib/player'

game = Game.new
game_data = game.load_game

game_data.each do |data|
    prev_score = 0

    print "Frame\t"

    (1..10).each do |i|
        print "#{i}\t\t"
    end

    print "\n"

    puts data.name
    
    pinfalls = data.pinfalls

    frames = Array.new(10, nil)
    frame = 0
    roll = 0

    is_second_roll = false

    while roll < pinfalls.length - 1 do
        score = pinfalls[roll]
        next_score = pinfalls[roll + 1]        

        if frame < 9
            if score.to_i == 10 # is a strike        
                frames[frame] = score
            else # not a strike         
                frames[frame] = [score, next_score]
                roll+=1
            end
        else
            frames[frame] = [score, next_score, pinfalls.last]
            roll+=1
        end

        roll += 1
        frame += 1
    end

    print "\n"
    
    puts "-------------"

    frames.each do |frame|
        puts "---"
        print frame
        print "\n"
    end

end

#puts game_data.inspect
