class Player
    attr_accessor :name, :pinfalls

    def initialize
        self.pinfalls = []
    end

    def add_pinfalls(pinfall)
        pinfalls << pinfall
    end
end