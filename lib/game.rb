require_relative 'player'
require_relative 'pinfall'
require_relative 'score'

class Game

    def read_file
        print "Enter filename: "
        filename = gets.chomp

        if validate_file_existence(filename)
            file = File.readlines(filename)
            return file
        end
        
        read_file()
    end

    def load_game
        players = Hash.new
        player = Player.new
        pinfall = Pinfall.new
        
        file = read_file()
        
        file.each do |line|
            line = line.strip.split("\t")
            player_name = line[0]
        
            if !players.include?(player_name)
                player = Player.new
                player.name = player_name
                players[player.name] = player
            end

            pins = line[1]

            pinfall.validate_pinfall(pins)
            
            players[player_name].add_pinfalls(pins)
        end

        player.validate_pinfalls(players.values)

        return players.values
    end

    def print_game()

        game_data = load_game()

        pinfall = Pinfall.new
        score = Score.new

        game_data.each do |player|
            puts player.name
            
            pinfalls = player.pinfalls
            
            frames = player.process_pinfalls(pinfalls)

            player_score = score.process_score(frames)        
        
            pinfall.print_pinfalls(frames)
        
            score.print_score(player_score)
        end
    end

    def print_frames

        print "Frame\t\t"

        (1..10).each do |i|
            print "#{i}\t\t"
        end

        print "\n"
    end

    def validate_file_existence(filename)
        if File.file?(filename)
            return true
        end

        puts "ERROR: File not found. Could not find '#{filename}'. Please enter a valid filename"
        return false
    end
end