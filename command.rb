class Command
	def initialize(values)
		@valera = Valera.instance
		@values = values
	end
	
	def execute
	end
end

module CommandModule
	def execute
		conditions = @values['conditions']
		
		res = true
		if conditions != nil then
			conditions.each do |condition|
				cond = Condition.new(condition['value1'], condition['oper'], condition['value2'])
				
				res &= cond.true?
			end
		end
		
		if (res) then
			@valera.health += @values['health']
			@valera.mana += @values['mana']
			@valera.joy += @values['joy']
			@valera.fatigue += @values['fatigue']
			@valera.money += @values['money']
		end
	end
end