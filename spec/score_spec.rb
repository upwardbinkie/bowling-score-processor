require_relative '../lib/score'

describe 'Score' do
    it 'validates a frame with value 10 as true' do
        score = Score.new
        frame = "10"
        frame_number = 1

        result = score.validate_frame(frame, frame_number)

        expect(result).to be_truthy
    end

    it 'validates a frame with sum value of 10 as true' do
        score = Score.new
        frame = [5,5]
        frame_number = 1

        result = score.validate_frame(frame, frame_number)

        expect(result).to be_truthy
    end

    it 'validates a frame with sum value of more than 10 as true if last frame' do
        score = Score.new
        frame = [5,9,4]
        frame_number = 9

        result = score.validate_frame(frame, frame_number)

        expect(result).to be_truthy
    end

    it 'processes scores' do
        score = Score.new
        frames = [[1,5],10,[9,1],10,["F",6],[1,5],10,[8,2],[9,1],[10,2,3]]

        result = score.process_score(frames)

        expect(result).to be_truthy
    end
end