require_relative 'player'
require_relative 'pinfall'
require_relative 'score'

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

    def print_game()

        game_data = load_game()

        pinfall = Pinfall.new
        score = Score.new

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
    end

end