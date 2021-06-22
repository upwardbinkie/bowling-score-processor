require_relative '../lib/player'

describe 'Player' do
    it 'adds values to pinfalls array' do
        player = Player.new
        pinfalls = [1,2,3,4]

        player.add_pinfalls(pinfalls[0])
        player.add_pinfalls(pinfalls[1])
        player.add_pinfalls(pinfalls[2])
        player.add_pinfalls(pinfalls[3])

        expect(player.pinfalls).to match_array([1,2,3,4])
    end

    it 'processes pinfalls' do
        player = Player.new
        pinfalls = [1,5,10,9,1,10,"F",6,1,5,10,8,2,9,1,10,2,3]

        player.process_pinfalls(pinfalls)

        expect(player.frames).to match_array([[1,5],10,[9,1],10,["F",6],[1,5],10,[8,2],[9,1],[10,2,3]])
    end

    it 'validates pinfalls amount are correct' do
        players = Hash.new
        player = Player.new
        player.pinfalls = [1,5,10,9,1,10,"F",6,1,5,10,8,2,9,1,10,2,3]
        players["Test"] = player
        
        result = player.validate_pinfalls(players.values)

        expect(result).to be_truthy
    end
end