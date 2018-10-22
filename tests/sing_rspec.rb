require '../config'
require '../valera'
require '../condition'
require '../command'
require 'rspec'

describe Command do
    describe '#execute' do
        before(:context) do
            @valera = Valera.instance
            @config = Config.new('../config.yaml')
            @config.pars
            @sing = @config.coms[5]
        end

        context 'when it is OK' do
            before(:context) do
                @sing.execute
            end

            it 'joy should be 1' do
                expect(@valera.joy).to eq 1
            end

            it 'mana should be 10' do
                expect(@valera.mana).to eq 10
            end

            it 'fatigue should be 20' do
                expect(@valera.fatigue).to eq 20
            end

            it 'health should be 100' do
                expect(@valera.health).to eq 100
            end

            it 'money should be 10' do
                expect(@valera.money).to eq 10
            end
        end
    end
end