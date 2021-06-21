class Score
    def process_score(frames)
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

        return scores
    end

    def print_score(scores)

        print "Score\t\t"

        score = 0
        scores.each do |s|
            score += s
            print "#{score}\t\t"
        end
        
        print "\n"
    end
end