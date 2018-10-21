require '../config'
require '../valera'
require '../condition'
require '../command'
require 'rspec'

describe Config do
    describe 'pars' do
        let (:valera) { Valera.instance }

        before(:all) do
            @config = Config.new('../config.yaml')
            @config.pars
            @work = @config.coms[0]
            @work.execute
        end

        context 'when it is OK' do
            it 'money should be 100' do
                expect(valera.money).to eq 100
            end

            it 'joy should be -5' do
                expect(valera.joy).to eq (-5)
            end

            it 'mana should be 0' do
                expect(valera.mana).to eq 0
            end

            it 'fatigue should be 70' do
                expect(valera.fatigue).to eq 70
            end
        end

        context 'when fatigue > 10' do
            it 'money should be 100' do
                expect(valera.money).to eq 100
            end

            it 'joy should be -5' do
                expect(valera.joy).to eq -5
            end

            it 'mana should be 0' do
                expect(valera.mana).to eq 0
            end

            it 'fatigue should be 70' do
                expect(valera.fatigue).to eq 70
            end
        end

        context 'when mana >= 50' do
            before do
                valera.mana = 50
                valera.fatigue = 0
            end

            it 'money should be 100' do
                expect(valera.money).to eq 100
            end

            it 'joy should be -5' do
                expect(valera.joy).to eq -5
            end

            it 'mana should be 50' do
                expect(valera.mana).to eq 50
            end

            it 'fatigue should be 0' do
                expect(valera.fatigue).to eq 0
            end
        end
    end
end