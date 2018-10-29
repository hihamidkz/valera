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
end
