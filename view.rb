class View
	def initialize
		@valera = Valera.instance
	end
	def render
		puts "health = #{@valera.health}"
		puts "mana = #{@valera.mana}"
		puts "joy = #{@valera.joy}"
		puts "fatigue = #{@valera.fatigue}"
		puts "money = #{@valera.money}"
	end
end

