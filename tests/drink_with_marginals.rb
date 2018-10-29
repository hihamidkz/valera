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
            @drink_with_marginals = coms[4]
        end

        context 'when it is OK' do
            before(:context) do
                @valera.money = 150
                @drink_with_marginals.execute
            end

            it 'joy should be 5' do
                expect(@valera.joy).to eq 5
            end

            it 'mana should be 90' do
                expect(@valera.mana).to eq 90
            end

            it 'fatigue should be 80' do
                expect(@valera.fatigue).to eq 80
            end

            it 'health should be 20' do
                expect(@valera.health).to eq 20
            end

            it 'money should be 0' do
                expect(@valera.money).to eq 0
            end
        end

        context 'when not enough money' do
            before(:context) do
                @drink_with_marginals.execute
            end

            it 'joy should be 5' do
                expect(@valera.joy).to eq 5
            end

            it 'mana should be 90' do
                expect(@valera.mana).to eq 90
            end

            it 'fatigue should be 80' do
                expect(@valera.fatigue).to eq 80
            end

            it 'health should be 20' do
                expect(@valera.health).to eq 20
            end

            it 'money should be 0' do
                expect(@valera.money).to eq 0
            end
        end
    end
end