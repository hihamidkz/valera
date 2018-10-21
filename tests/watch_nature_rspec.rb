require '../config'
require '../valera'
require '../condition'
require '../command'
require 'rspec'

describe Config do
    describe 'pars' do
        let (:valera) { Valera.instance }

        before(:context) do
            @config = Config.new('../config.yaml')
            @config.pars
            @watch = @config.coms[1]
            @watch.execute
        end

        context 'when it is OK' do
            it 'joy should be 1' do
                expect(valera.joy).to eq 1
            end

            it 'mana should be 0' do
                expect(valera.mana).to eq 0
            end

            it 'fatigue should be 10' do
                expect(valera.fatigue).to eq 10
            end
        end
    end
end