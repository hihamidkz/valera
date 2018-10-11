require '../commands'
require '../valera'
require 'rspec'

describe WorkCommand do
    describe '#execute' do
        let (:work) { WorkCommand.new(valera) }

        context 'when it is OK' do
            let (:valera) { Valera.new }

            before do
                valera.mana = 30;
                work.execute
            end

            it 'money should be 100' do
                expect(valera.money).to eq 100
            end

            it 'joy should be -5' do
                expect(valera.joy).to eq -5
            end

            it 'mana should be 0' do
                expect(valera.mana).to eq 0
            end

            it 'tiredness should be 70' do
                expect(valera.tiredness).to eq 70
            end
        end

        context 'when joy equals -10' do
            let (:valera) { Valera.new }

            before do
                valera.joy = -10;
                work.execute
            end

            it 'joy should be -10' do
                expect(valera.joy).to eq -10
            end
        end

        context 'when mana equals 0' do
            let (:valera) { Valera.new }

            before do
                work.execute
            end

            it 'mana should be 0' do
                expect(valera.mana).to eq 0
            end
        end

        context 'when tiredness > 10' do
            let (:valera) { Valera.new }

            before do
                valera.tiredness = 20;
                work.execute
            end

            it 'money should be 0' do
                expect(valera.money).to eq 0
            end

            it 'joy should be 0' do
                expect(valera.joy).to eq 0
            end

            it 'mana should be 0' do
                expect(valera.mana).to eq 0
            end

            it 'tiredness should be 20' do
                expect(valera.tiredness).to eq 20
            end
        end

        context 'when mana > 50' do
            let (:valera) { Valera.new }

            before do
                valera.mana = 60;
                work.execute
            end

            it 'money should be 0' do
                expect(valera.money).to eq 0
            end

            it 'joy should be 0' do
                expect(valera.joy).to eq 0
            end

            it 'mana should be 60' do
                expect(valera.mana).to eq 60
            end

            it 'tiredness should be 00' do
                expect(valera.tiredness).to eq 00
            end
        end
    end
end