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
            @watch = @config.coms[3]
        end

        context 'when it is OK' do
            before(:context) do
                @valera.money = 100
                @watch.execute
            end

            it 'joy should be 1' do
                expect(@valera.joy).to eq 1
            end

            it 'mana should be 60' do
                expect(@valera.mana).to eq 60
            end

            it 'fatigue should be 40' do
                expect(@valera.fatigue).to eq 40
            end

            it 'health should be 90' do
                expect(@valera.health).to eq 90
            end

            it 'money should be 0' do
                expect(@valera.money).to eq 0
            end
        end

        context 'when not enough money' do
            before(:context) do
                @watch.execute
            end

            it 'joy should be 1' do
                expect(@valera.joy).to eq 1
            end

            it 'mana should be 60' do
                expect(@valera.mana).to eq 60
            end

            it 'fatigue should be 40' do
                expect(@valera.fatigue).to eq 40
            end

            it 'health should be 90' do
                expect(@valera.health).to eq 90
            end

            it 'money should be 0' do
                expect(@valera.money).to eq 0
            end
        end
    end
end