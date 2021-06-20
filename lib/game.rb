require_relative 'player'

class Game

    def read_file
        print "Enter filename: "
        filename = gets.chomp

        file = File.readlines(filename)
        
        return file
    end

    def load_game
        players = Hash.new
        
        file = read_file()
        
        file.each do |line|
            line = line.strip.split("\t")
        
            if !players.include?(line[0])
                player = Player.new
                player.name = line[0]
                players[player.name] = player
            end
            
            players[line[0]].add_pinfalls(line[1])
        end

        return players.values
    end

end