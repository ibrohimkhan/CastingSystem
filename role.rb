module Casting
	class Role
		attr_reader :theme, :age_range, :gender 
		
		def initialize(theme, age_range, gender)
			@theme, @age_range, @gender = theme, age_range, gender
		end
				
	end	
end