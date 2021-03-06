require 'yaml'

class Controller
	def initialize(array, view)
		@valera = Valera.instance
		@commands = array
		@view = view
	end
	def input
		flag = 1
		puts "Enter a command number ranging from 0 to #{@commands.length - 1}"
		puts "Or enter -1 to exit"
		while flag == 1 do
			number = gets.chomp.to_i
			if (number >= @commands.length and number >=-1)
				puts "You have entered incorrect data. Repeat input"
			else
				flag = 0
			end
		end
		return number
	end
	def step
		if @valera.is_dead?
			puts "Valera is dead"
			-2
		else
			@view.render
			@commands.each_with_index do |command, index|
				puts "#{index} - #{command.class}"
			end
			number = input
			if (number == -1)
				-1
			else
				if @commands[number].execute == -1
				puts "The condition is not satisfied"
				end
			end
		end
	end
	def start
		puts "Enter -1 if you want to exit, 1 if you want to launch new game or 2 if you want to load the game"
		return gets.chomp.to_i
	end
	def finish
		puts "If you want to save the game enter 1 or enter any else if you don't"
		return gets.chomp.to_i
	end
	def save
		File.open('valera.save', 'w'){ |file| file.write "health: #{@valera.health}\n"}
		File.open('valera.save', 'a'){ |file| file.write "mana: #{@valera.mana}\n"}
		File.open('valera.save', 'a'){ |file| file.write "joy: #{@valera.joy}\n"}
		File.open('valera.save', 'a'){ |file| file.write "fatigue: #{@valera.fatigue}\n"}
		File.open('valera.save', 'a'){ |file| file.write "money: #{@valera.money}\n"}
	end
	def load
		string = File.open('valera.save'){ |file| file.read }
		object = YAML.load(string)
		@valera.health = object['health']
		@valera.mana = object['mana']
		@valera.joy = object['joy']
		@valera.fatigue = object['fatigue']
		@valera.money = object['money']
	end
end
