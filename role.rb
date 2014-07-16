module Casting
	class Role
		attr_reader :theme, :age_range, :gender 
		
		def initialize(theme, age_range, gender)
			raise "Role, object initialization is wrong" if theme.nil? || !theme.instance_of?(String) || age_range.nil? || !age_range.instance_of?(Range) || gender.nil? || !['male', 'female'].include?(gender)
			@theme, @age_range, @gender = theme, age_range, gender
		end
		
	end	
end
