require '../commands'
require '../valera'
require 'rspec'

describe WatchNatureCommand do
    describe '#execute' do
        let (:watch) { WatchNatureCommand.new(valera) }

        context 'when it is OK' do
            let (:valera) { Valera.new }

            before do
                valera.mana = 10;
                watch.execute
            end

            it 'joy should be 1' do
                expect(valera.joy).to eq 1
            end

            it 'mana should be 0' do
                expect(valera.mana).to eq 0
            end

            it 'tiredness should be 10' do
                expect(valera.tiredness).to eq 10
            end
        end

        context 'when mana equals 0' do
            let (:valera) { Valera.new }

            before do
                watch.execute
            end

            it 'mana should be 0' do
                expect(valera.mana).to eq 0
            end
        end
    end
end