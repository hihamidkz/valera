require 'singleton'

class Valera
	include Singleton
	attr_reader :health, :mana, :joy, :fatigue, :money
	def initialize
		@health, @mana, @joy, @fatigue, @money = 100, 0, 0, 0, 0
	end
	def health=(health)
		if (health > 100)
			@health = 100
		elsif (health < 0)
			@health = 0
		else 
			@health = health
		end
	end
	def mana=(mana)
		if (mana > 100)
			@mana = 100
		elsif (mana < 0)
			@mana = 0
		else
			@mana = mana
		end
	end
	def joy=(joy)
		if (joy > 10)
			@joy = 10
		elsif (joy < -10)
			@joy = -10
		else
			@joy = joy
		end
	end
	def fatigue=(fatigue)
		if (fatigue > 100)
			@fatigue = 100
		elsif (fatigue < 0)
			@fatigue = 0
		else
			@fatigue = fatigue
		end
	end
	def money=(money)
		@money = money
	end

	def is_dead?
		self.health == 0
	end
end
