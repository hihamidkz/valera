require './valera'
require './command'
require './condition'
require './config'
require './view'
require './controller'

class Application
	def initialize
		@view = View.new
		@config = Config.new('config.yaml')
		@controller = Controller.new(@config.pars, @view)
	end
	def run
		loop do
			decision = @controller.step
			if decision == -1
				return -1
			elsif decision == -2
				return -2
			end
		end
	end
	def menu
		command = @controller.start
		if (command == -1)
			return -1
		elsif (command == 2)
			@controller.load
			save_or_not = run
		elsif (command == 1)
			save_or_not = run
		end
		if (save_or_not == -1)
			if (@controller.finish == 1)
				@controller.save
			end
		end
	end
end
