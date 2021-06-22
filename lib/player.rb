class Player
    attr_accessor :name, :pinfalls, :frames

    def initialize
        self.pinfalls = []
        self.frames = Array.new(10, nil)
    end

    def add_pinfalls(pinfall)
        pinfalls << pinfall
    end

    def process_pinfalls(pinfalls)
        frame = 0
        roll = 0
    
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
                frames[frame] = [pins, next_pins, pinfalls[roll + 2]]
                roll+=1
            end
    
            roll += 1
            frame += 1
        end

        return self.frames
    end    
    
    def validate_pinfalls(players)
        players.each do |player|
            player_rolls = player.pinfalls.length

            if player_rolls < 12
                print_not_enough_moves_error()
            end

            if player_rolls > 21
                print_too_many_moves_error()
            end

            strikes = 0
            player.pinfalls[0..-3].each do |pinfall|
                if pinfall.to_i == 10
                    strikes += 1
                end
            end
            
            permitted_moves = player_rolls + strikes

            if permitted_moves != 21 && permitted_moves != 22
                print_invalid_moves_amount_error()
            end
        end
    end

    def print_not_enough_moves_error()
        puts "ERROR: Not enough moves"
        exit(false)
    end    

    def print_too_many_moves_error()
        puts "ERROR: Too many moves"
        exit(false)
    end    

    def print_invalid_moves_amount_error()
        puts "ERROR: Invalid amount of moves"
        exit(false)
    end
end