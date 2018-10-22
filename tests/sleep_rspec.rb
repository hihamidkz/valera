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
            @sleep = @config.coms[6]
        end

        context 'when it is OK' do
            before(:context) do
                @valera.health = 10;
                @valera.mana = 100;
                @valera.fatigue = 70;
                @sleep.execute
            end

            it 'joy should be -3' do
                expect(@valera.joy).to eq -3
            end

            it 'mana should be 50' do
                expect(@valera.mana).to eq 50
            end

            it 'fatigue should be 0' do
                expect(@valera.fatigue).to eq 0
            end

            it 'health should be 100' do
                expect(@valera.health).to eq 100
            end

            it 'money should be 0' do
                expect(@valera.money).to eq 0
            end
        end
    end
end