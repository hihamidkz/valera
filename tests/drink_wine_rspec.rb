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
            coms = @config.pars
            @drink_wine = coms[2]
        end

        context 'when it is OK' do
            before(:context) do
                @valera.money = 20
                @drink_wine.execute
            end

            it 'joy should be -1' do
                expect(@valera.joy).to eq -1
            end

            it 'mana should be 30' do
                expect(@valera.mana).to eq 30
            end

            it 'fatigue should be 10' do
                expect(@valera.fatigue).to eq 10
            end

            it 'health should be 95' do
                expect(@valera.health).to eq 95
            end

            it 'money should be 0' do
                expect(@valera.money).to eq 0
            end
        end

        context 'when not enough money' do
            before(:context) do
                @drink_wine.execute
            end

            it 'joy should be -1' do
                expect(@valera.joy).to eq -1
            end

            it 'mana should be 30' do
                expect(@valera.mana).to eq 30
            end

            it 'fatigue should be 10' do
                expect(@valera.fatigue).to eq 10
            end

            it 'health should be 95' do
                expect(@valera.health).to eq 95
            end

            it 'money should be 0' do
                expect(@valera.money).to eq 0
            end
        end
    end
end