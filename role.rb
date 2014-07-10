module Casting
	class Role
		attr_reader :age, :theme
		
		def initialize(age, theme)
			@age = age
			@theme = theme
		end
				
		def to_s
			@theme
		end
	end
	
	class ManRole < Role
		Gender = 'male'
		
		def initialize(age, theme)
			super
		end		
		
		def get_gender
			Gender
		end
	end
	
	class WomanRole < Role
		Gender = 'female'
		
		def initialize(age, theme)
			super
		end

		def get_gender
			Gender
		end
	end
end