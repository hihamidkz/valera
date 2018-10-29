require 'yaml'

class Controller
	def initialize(array, view)
		@valera = Valera.instance
		@commands = array
		@view = view
	end
end
