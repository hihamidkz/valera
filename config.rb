require 'yaml'

class Config

	attr_reader :coms
	
	def initialize(config_file)
		@config_file = IO.read(config_file)
		@config = YAML.load(@config_file)
	end

	def pars
		commands_pool = []
		@config['commands'].each do |command|
			class_name = command['classname']

			com = Object.const_set(class_name, 
				Class.new(Command) do
					include CommandModule
				end
			)
			commands_pool << com.new(command)
		end
		commands_pool
	end

end