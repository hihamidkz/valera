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
end
