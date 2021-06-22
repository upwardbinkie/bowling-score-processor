class Pinfall    

    def validate_pinfall(pins)
        if pins =~ /[0-9F]/
            return
        end
        
        puts "ERROR: #{pins} is not a valid value"
        exit(false)
    end

    def print_pinfalls(frames)
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
    end
end