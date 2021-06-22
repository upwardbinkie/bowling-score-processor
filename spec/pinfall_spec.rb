require_relative '../lib/pinfall'

describe 'Pinfall' do
    it 'validates that pinfall value of 10 is valid' do
        pinfall = Pinfall.new
        pins = "10"

        result = pinfall.validate_pinfall(pins)

        expect(result).to be_truthy
    end

    it 'validates that pinfall value of F is valid' do
        pinfall = Pinfall.new
        pins = "F"

        result = pinfall.validate_pinfall(pins)

        expect(result).to be_truthy
    end
end