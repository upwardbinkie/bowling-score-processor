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
            player_name = line[0]
        
            if !players.include?(player_name)
                player = Player.new
                player.name = player_name
                players[player.name] = player
            end
            
            players[player_name].add_pinfalls(line[1])
        end

        return players.values
    end

end