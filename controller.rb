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
end
