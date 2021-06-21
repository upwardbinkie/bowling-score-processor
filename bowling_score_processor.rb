require_relative 'lib/game'
require_relative 'lib/player'

game = Game.new
game_data = game.load_game

print "Frame\t\t"

(1..10).each do |i|
    print "#{i}\t\t"
end

print "\n"

game_data.each do |data|
    prev_pins = 0

    puts data.name
    
    pinfalls = data.pinfalls

    frames = Array.new(10, nil)
    frame = 0
    roll = 0

    is_second_roll = false

    while roll < pinfalls.length - 1 do
        pins = pinfalls[roll]
        next_pins = pinfalls[roll + 1]        

        if frame < 9
            if pins.to_i == 10 # is a strike        
                frames[frame] = pins
            else # not a strike         
                frames[frame] = [pins, next_pins]
                roll+=1
            end
        else
            frames[frame] = [pins, next_pins, pinfalls.last]
            roll+=1
        end

        roll += 1
        frame += 1
    end

    print "Pinfalls"
    frames.each do |frame|
        if frame == "10"
            print "\t\tX"
            next
        end

        if frame.length == 3
            frame.each do |f|
                if f == "10"
                    print "\tX"
                else
                    print "\t#{f}"
                end
            end
            next
        end

        if frame[0].to_i + frame[1].to_i == 10
            print "\t#{frame[0]}"
            print "\t/"
        else
            print "\t#{frame[0]}"
            print "\t#{frame[1]}"
        end
    end
    
    print "\n"

    print "Score\t\t"
    scores = Array.new

    (0..9).each do |i|
        
        if(i == 9)
            scores[i] = frames[i].map(&:to_i).sum
            next
        end
        
        next_frame = frames[i + 1]

        if frames[i] == "10"
            if next_frame.kind_of?(Array)
                scores[i] = 10 + next_frame[0].to_i + next_frame[1].to_i
            else
                if frames[i + 2].kind_of?(Array)
                    scores[i] = 10 + 10 + frames[i + 2][0].to_i
                else
                    scores[i] = 10 + 10 + 10
                end
            end
            next
        end

        current_frame_score = frames[i][0].to_i + frames[i][1].to_i

        if current_frame_score == 10
            if next_frame.kind_of?(Array)
                scores[i] = 10 + next_frame[0].to_i
            else
                scores[i] = 10 + 10
            end
            next
        end

        scores[i] = current_frame_score
    end

    score = 0
    scores.each do |s|
        score += s
        print "#{score}\t\t"
    end
    
    print "\n"

end

#puts game_data.inspect
