class Player
    attr_accessor :name, :pinfalls, :frames

    def initialize
        self.pinfalls = []
        self.frames = Array.new(10, nil)
    end

    def add_pinfalls(pinfall)
        pinfalls << pinfall
    end

    def set_frames(pinfalls)
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
end