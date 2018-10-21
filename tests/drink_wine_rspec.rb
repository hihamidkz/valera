require '../config'
require '../valera'
require '../condition'
require '../command'
require 'rspec'

describe Command do
    describe '#execute' do
        before(:context) do
            @valera = Valera.instance
            @valera.money = 20;
            @config = Config.new('../config.yaml')
            @config.pars
            @watch = @config.coms[2]
            @watch.execute
        end

        context 'when it is OK' do
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